desc 'Run apipie-postman'

task apipie_postman: :environment do
  puts ApipiePostman.generate_docs
end