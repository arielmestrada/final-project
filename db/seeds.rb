# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# ["Affenpinscher",
#     "Afghan Hound",
#     "African Hunting Dog",
#     "Airedale Terrier",
#     "Akbash Dog",
#     "Akita",
#     "Alapaha Blue Blood Bulldog",
#     "Alaskan Husky",
#     "Alaskan Malamute",
#     "American Bulldog",
#     "American Bully",
#     "American Eskimo Dog",
#     "American Eskimo Dog (Miniature)",
#     "American Foxhound",
#     "American Pit Bull Terrier",
#     "American Staffordshire Terrier",
#     "American Water Spaniel",
#     "Anatolian Shepherd Dog",
#     "Appenzeller Sennenhund",
#     "Australian Cattle Dog",
#     "Australian Kelpie",
#     "Australian Shepherd",
#     "Australian Terrier",
#     "Azawakh",
#     "Barbet",
#     "Basenji",
#     "Basset Bleu de Gascogne",
#     "Basset Hound",
#     "Beagle",
#     "Bearded Collie",
#     "Beauceron",
#     "Bedlington Terrier",
#     "Belgian Malinois",
#     "Belgian Tervuren",
#     "Bernese Mountain Dog",
#     "Bichon Frise",
#     "Black and Tan Coonhound",
#     "Bloodhound",
#     "Bluetick Coonhound",
#     "Boerboel",
#     "Border Collie",
#     "Border Terrier",
#     "Boston Terrier",
#     "Bouvier des Flandres",
#     "Boxer",
#     "Boykin Spaniel",
#     "Bracco Italiano",
#     "Briard",
#     "Brittany",
#     "Bull Terrier",
#     "Bull Terrier (Miniature)",
#     "Bullmastiff",
#     "Cairn Terrier",
#     "Cane Corso",
#     "Cardigan Welsh Corgi",
#     "Catahoula Leopard Dog",
#     "Caucasian Shepherd (Ovcharka)",
#     "Cavalier King Charles Spaniel",
#     "Chesapeake Bay Retriever",
#     "Chinese Crested",
#     "Chinese Shar-Pei",
#     "Chinook",
#     "Chow Chow",
#     "Clumber Spaniel",
#     "Cocker Spaniel",
#     "Cocker Spaniel (American)",
#     "Coton de Tulear",
#     "Dalmatian",
#     "Doberman Pinscher",
#     "Dogo Argentino",
#     "Dutch Shepherd",
#     "English Setter",
#     "English Shepherd",
#     "English Springer Spaniel",
#     "English Toy Spaniel",
#     "English Toy Terrier",
#     "Eurasier",
#     "Field Spaniel",
#     "Finnish Lapphund",
#     "Finnish Spitz",
#     "French Bulldog",
#     "German Pinscher",
#     "German Shepherd Dog",
#     "German Shorthaired Pointer",
#     "Giant Schnauzer",
#     "Glen of Imaal Terrier",
#     "Golden Retriever",
#     "Gordon Setter",
#     "Great Dane",
#     "Great Pyrenees",
#     "Greyhound",
#     "Griffon Bruxellois",
#     "Harrier",
#     "Havanese",
#     "Irish Setter",
#     "Irish Terrier",
#     "Irish Wolfhound",
#     "Italian Greyhound",
#     "Japanese Chin",
#     "Japanese Spitz",
#     "Keeshond",
#     "Komondor",
#     "Kooikerhondje",
#     "Kuvasz",
#     "Labrador Retriever",
#     "Lagotto Romagnolo",
#     "Lancashire Heeler",
#     "Leonberger",
#     "Lhasa Apso",
#     "Maltese",
#     "Miniature American Shepherd",
#     "Miniature Pinscher",
#     "Miniature Schnauzer",
#     "Newfoundland",
#     "Norfolk Terrier",
#     "Norwich Terrier",
#     "Nova Scotia Duck Tolling Retriever",
#     "Old English Sheepdog",
#     "Olde English Bulldogge",
#     "Papillon",
#     "Pekingese",
#     "Pembroke Welsh Corgi",
#     "Perro de Presa Canario",
#     "Pharaoh Hound",
#     "Plott",
#     "Pomeranian",
#     "Poodle (Miniature)",
#     "Poodle (Toy)",
#     "Pug",
#     "Puli",
#     "Pumi",
#     "Rat Terrier",
#     "Redbone Coonhound",
#     "Rhodesian Ridgeback",
#     "Rottweiler",
#     "Russian Toy",
#     "Saint Bernard",
#     "Saluki",
#     "Samoyed",
#     "Schipperke",
#     "Scottish Deerhound",
#     "Scottish Terrier",
#     "Shetland Sheepdog",
#     "Shiba Inu",
#     "Shih Tzu",
#     "Shiloh Shepherd",
#     "Siberian Husky",
#     "Silky Terrier",
#     "Smooth Fox Terrier",
#     "Soft Coated Wheaten Terrier",
#     "Spanish Water Dog",
#     "Spinone Italiano",
#     "Staffordshire Bull Terrier",
#     "Standard Schnauzer",
#     "Swedish Vallhund",
#     "Thai Ridgeback",
#     "Tibetan Mastiff",
#     "Tibetan Spaniel",
#     "Tibetan Terrier",
#     "Toy Fox Terrier",
#     "Treeing Walker Coonhound",
#     "Vizsla",
#     "Weimaraner",
#     "Welsh Springer Spaniel",
#     "West Highland White Terrier",
#     "Whippet",
#     "White Shepherd",
#     "Wire Fox Terrier",
#     "Wirehaired Pointing Griffon",
#     "Wirehaired Vizsla",
#     "Xoloitzcuintli",
#     "Yorkshire Terrier"]

Breed.create(
  name: 'Golden Retriever',
  bred_for: 'Retrieving',
  breed_group: 'Sporting',
  facts: 'Golden Retrievers trace their history back to Scotland.',
  temperament: %w[Intelligent Kind Reliable Friendly Trustworthy Confident],
  image_url: 'https://cdn2.thedogapi.com/images/HJ7Pzg5EQ_1280.jpg'
)

Breed.create(
  name: 'German Shepherd',
  bred_for: 'Herding, Guard dog',
  breed_group: 'Herding',
  facts: 'German Shepherds will explore everything with their noses.',
  temperament: %w[Alert Loyal Obedient Curious Confident Intelligent Watchful Courageous],
  image_url: 'https://cdn2.thedogapi.com/images/SJyBfg5NX_1280.jpg'
)

Breed.create(
  name: 'Rottweiler',
  bred_for: 'Cattle drover, guardian, draft',
  breed_group: 'Working',
  facts: 'Once a Roman Drover Dog.',
  temperament: %w[Steady Good-natured Fearless Devoted Alert Obedient Confident Self-assured Calm Courageous],
  image_url: 'https://cdn2.thedogapi.com/images/r1xXEgcNX_1280.jpg'
)

Breed.create(
  name: 'Beagle',
  bred_for: 'Rabbit, hare hunting',
  breed_group: 'Hound',
  facts: 'Beagles were bred for hunting.',
  temperament: %w[Amiable Even Tempered Excitable Determined Gentle Intelligent],
  image_url: 'https://cdn2.thedogapi.com/images/Syd4xxqEm_1280.jpg'
)

Breed.create(
  name: 'Dachshund',
  bred_for: 'Rabbit hunting',
  breed_group: 'Hound',
  facts: 'They Were Bred to Hunt Badgers.',
  temperament: %w[Clever Stubborn Devoted Lively Playful Courageous],
  image_url: 'https://dogtime.com/assets/uploads/2011/01/file_23020_dachshund-dog-breed.jpg'
)

Breed.create(
  name: 'Siberian Husky',
  bred_for: 'Sled pulling',
  breed_group: 'Working',
  facts: 'Two Huskies guard the gates of heaven.',
  temperament: %w[Outgoing Friendly Alert Gentle Intelligent],
  image_url: 'https://cdn2.thedogapi.com/images/S17ZilqNm_1280.jpg'
)

# ADMIN
@admin = User.new(
  email: 'admin@email.com',
  image_url: 'https://xsgames.co/randomusers/assets/avatars/male/1.jpg',
  password: 'password',
  password_confirmation: 'password',
  admin: true,
  first_name: 'Admin',
  last_name: 'LastName',
  mobile_number: 11_111_111_111,
  birthdate: '2000-01-01',
  sex: 'male'
)

@admin.skip_confirmation!
@admin.save!

@user_01 = User.new(
  email: 'dummy01@email.com',
  image_url: 'https://xsgames.co/randomusers/assets/avatars/male/3.jpg',
  password: '123456',
  password_confirmation: '123456',
  first_name: 'John',
  last_name: 'Middleton',
  mobile_number: 11_111_111_111,
  birthdate: '1990-01-01',
  sex: 'male'
)
@user_01.skip_confirmation!
@user_01.save!

@user_02 = User.new(
  email: 'dummy02@email.com',
  image_url: 'https://xsgames.co/randomusers/assets/avatars/male/4.jpg',
  password: '123456',
  password_confirmation: '123456',
  first_name: 'Blip',
  last_name: 'Horton',
  mobile_number: 11_111_111_111,
  birthdate: '1990-02-02',
  sex: 'male'
)
@user_02.skip_confirmation!
@user_02.save!

@user_03 = User.new(
  email: 'dummy03@email.com',
  image_url: 'https://xsgames.co/randomusers/assets/avatars/male/5.jpg',
  password: '123456',
  password_confirmation: '123456',
  first_name: 'Lloyd',
  last_name: 'Valenciaga',
  mobile_number: 11_111_111_111,
  birthdate: '1990-03-03',
  sex: 'male'
)
@user_03.skip_confirmation!
@user_03.save!

@user_04 = User.new(
  email: 'dummy04@email.com',
  image_url: 'https://xsgames.co/randomusers/assets/avatars/male/6.jpg',
  password: '123456',
  password_confirmation: '123456',
  first_name: 'Bob',
  last_name: 'Hinge',
  mobile_number: 11_111_111_111,
  birthdate: '1990-04-04',
  sex: 'male'
)
@user_04.skip_confirmation!
@user_04.save!

@user_05 = User.new(
  email: 'dummy05@email.com',
  image_url: 'https://xsgames.co/randomusers/assets/avatars/male/7.jpg',
  password: '123456',
  password_confirmation: '123456',
  first_name: 'Lisa',
  last_name: 'Ann',
  mobile_number: 11_111_111_111,
  birthdate: '1990-05-05',
  sex: 'male'
)
@user_05.skip_confirmation!
@user_05.save!

@user_06 = User.new(
  email: 'dummy06@email.com',
  image_url: 'https://xsgames.co/randomusers/assets/avatars/male/8.jpg',
  password: '123456',
  password_confirmation: '123456',
  first_name: 'Gerald',
  last_name: 'Anderson',
  mobile_number: 11_111_111_111,
  birthdate: '1990-06-06',
  sex: 'male'
)
@user_06.skip_confirmation!
@user_06.save!

@user_07 = User.new(
  email: 'dummy07@email.com',
  image_url: 'https://xsgames.co/randomusers/assets/avatars/male/9.jpg',
  password: '123456',
  password_confirmation: '123456',
  first_name: 'Cliff',
  last_name: 'Hanger',
  mobile_number: 11_111_111_111,
  birthdate: '1990-07-07',
  sex: 'male'
)
@user_07.skip_confirmation!
@user_07.save!

@user_08 = User.new(
  email: 'dummy08@email.com',
  image_url: 'https://xsgames.co/randomusers/assets/avatars/male/10.jpg',
  password: '123456',
  password_confirmation: '123456',
  first_name: 'Alps',
  last_name: 'Coup',
  mobile_number: 11_111_111_111,
  birthdate: '1990-08-08',
  sex: 'male'
)
@user_08.skip_confirmation!
@user_08.save!

@user_09 = User.new(
  email: 'dummy09@email.com',
  image_url: 'https://xsgames.co/randomusers/assets/avatars/male/11.jpg',
  password: '123456',
  password_confirmation: '123456',
  first_name: 'Mathis',
  last_name: 'Royer',
  mobile_number: 11_111_111_111,
  birthdate: '1990-09-09',
  sex: 'male'
)
@user_09.skip_confirmation!
@user_09.save!

@user_10 = User.new(
  email: 'dummy10@email.com',
  image_url: 'https://xsgames.co/randomusers/assets/avatars/male/12.jpg',
  password: '123456',
  password_confirmation: '123456',
  first_name: 'Favreau',
  last_name: 'Evonne',
  mobile_number: 11_111_111_111,
  birthdate: '1990-10-10',
  sex: 'male'
)
@user_10.skip_confirmation!
@user_10.save!
