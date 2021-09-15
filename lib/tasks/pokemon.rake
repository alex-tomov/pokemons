namespace :pokemon do
  desc 'Import pokemons by consuming the PokeAPI V2'
  task import_data: :environment do
    # retrieve types
    items = TypeService.new.get_items.results
    items.each do |item|
      Type.find_or_create_by(name: item.name)
    end

    # retrieve pokemons
    page = 1
    while (items = PokemonService.new.get_items(page).results)
      break unless items.any?

      items.each do |item|
        puts "#{item.name} - #{item.url}"
        pokemon_entry = item.get
        pokemon = Pokemon.find_or_create_by(name: pokemon_entry.name)

        pokemon.update(name: pokemon_entry.name,
                      height: pokemon_entry.height,
                      weight: pokemon_entry.weight,
                      base_experience: pokemon_entry.base_experience,
                      is_default: pokemon_entry.is_default)

        ## update pokemons attributes

        pokemon_entry.types.each do |pokemon_type|
          type = Type.find_by(name: pokemon_type.type.name)

          Pokemon.find(pokemon.id).types.destroy_all
          pokemon.pokemon_types.find_or_create_by(pokemon_id: pokemon, type_id: type.id)
        end
      end

      page += 1
      puts "loading page: #{page}"
    end
  end
end
