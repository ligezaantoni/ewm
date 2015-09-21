puts "Czyszczenie tabeli users, activity_forms, character_traits oraz educational_methods."

User.destroy_all
ActivityForm.destroy_all
CharacterTrait.destroy_all
EducationalMethod.destroy_all

puts "Tworzenie użytkownika z uprawnieniami administratora."

User.create(email: "admin@admin.com", password: "admin", password_confirmation: "admin", role: "admin")

puts "Tworzenie metod i form pracy."

{
  "ruch/ przyroda" => {
    "zwiad" => "zdobywanie informacji na temat określonego miejsca lub regionu",
    "zawody sportowe" => "rywalizacja jeśli chodzi o dyscypliny indywidualne, współpraca przy dyscyplinach grupowych",
    "bieg na orientacje" => "aktywność wymagająca kondycji fizycznej oraz umiejętności szybkiego i trafnego wyboru trasy",
    "wędrówka" => "rozwija kondycję fizyczną",
    "złaz" => "piesze dojście grup harcerzy na miejsce zbiórki, gdzie odbywa się rywalizacja",
    "zlot" => "wspólne biwakowanie grup harcerzy rywalizujących ze sobą",
    "biwak" => "życie pod namiotem na łonie przyrody przez kilka dni",
    "rajd" => "dłuższa zbiórka, gdzie aktywności są przerywane dłuższymi odcinkami wędrówki pieszej"
  },
  "dobrowolność/ samowychowanie" => {
    "harc/ próba charakteru" => "zadanie wymagające inwencji, dostosowywane do indywidualnych potrzeb",
    "rozmowa" => "próba bezpośredniego dotarcia do harcerza poprzez poruszanie określonych tematów",
    "warty" => "stanie na straży obiektu, wymagające czujności i wytrwałości",
    "wyczyn" => "zadanie wymagające szczególnego wysiłku, zwykle jednorazowe",
    "służba" => "regularna pomoc osobom potrzebującym"
  },
  "hierarchia/ karność" => {
    "kurs" => "przygotowanie harcerza na pełnienie funkcji lub poprawienie wiedzy i umiejętności",
    "pełnienie funkcji" => "wywiązywanie się z określonego zestawu obowiązków",
    "musztra/ defilada" => "ćwiczenie karności i zgrania z zespołem",
    "apel" => "ćwiczenie karności, kultywacja zwyczajów",
    "zaciąg" => "zachęcenie młodych ludzi do wstępowania do drużyny"
  },
  "współpraca/ rywalizacja" => {
    "podchody" => "aktywność wymagająca czujności oraz sprawnego i niezauważalnego poruszania się w terenie",
    "bieg" => "forma sprawdzająca poziom wiedzy, umiejętności i sprawności fizycznej",
    "gra terenowa" => "zestaw aktywności zaplanowany na łonie przyrody",
    "gra miejska" => "zestaw aktywności zaplanowany w mieście",
    "rywalizacja/ punktacja" => "wyłanianie lepszych w danych aktywnościach",
    "alarm" => "ćwiczy gotowość harcerzy do akcji",
    "zbiórka łączona" => "zbiórka zorganizowana z inną jednostką harcerską"
  },
  "wzajemne oddziaływanie" => {
    "pionierka" => "projektowanie i budowanie konstrukcji",
    "warsztaty" => "zajęcia grupowe rozszerzające umiejętności w danej dziedzinie",
    "ognisko/ kominek" => "aktywności mające miejsce w grupie przy ognisku, zwykle przerywane piosenkami",
    "gawęda" => "opowieść metaforycznie reprezentująca rzeczywistość, zwykle z morałem",
    "dyskusja" => "rozszerzanie poglądów na dany temat",
    "obrzędowość" => "zwyczaje pogłębiające więzi w grupie",
    "modlitwa" => "spotkanie z Bogiem w rozmowie lub czuwaniu"
  },
  "pośrednie oddziaływanie" => {
    "gazetka" => "regularnie redagowana wymaga konsekwencji w prowadzeniu",
    "wystawka" => "przygotowywana na dany temat wymaga pogłębienia prezentowanego tematu",
    "krzyżówka" => "sprawdza wiedzę rozwiązującym",
    "KIM" => "sprawdzian dla wrażliwości zmysłów",
    "akcje zarobkowe" => "sposób na zapewnienie pieniędzy potrzebnych do innych aktywności",
    "gra gospodarcza" => "zestaw aktywności uczący ekonomii",
    "pląs" => "przerywnik ruchowy angażujący grupę harcerzy",
    "śpiewogranie" => "grupowe śpiewanie piosenek",
    "teatrzyk" => "artystyczna forma wymagająca spontaniczności",
    "film" => "artystyczna forma, ćwiczy organizację i przygotowanie"
  },
  "stopniowanie trudności" => {
    "quiz" => "sprawdzian wiedzy",
    "stopnie i sprawności" => "przyznawane za osiągnięcia w danych dziedzinach",
    "turniej" => "odzaj rywalizacji w systemie 'drabinki'",
    "kat. próbna" => "spełnienie wymagań, by sprawdzić czy drużyna znajduje się na danym poziomie",
    "kat. polowa" => "spełnienie wymagań, by sprawdzić czy drużyna znajduje się na danym poziomie",
    "kat. leśna" => "spełnienie wymagań, by sprawdzić czy drużyna znajduje się na danym poziomie",
    "kat. puszczańska" => "spełnienie wymagań, by sprawdzić czy drużyna znajduje się na danym poziomie"
  }
}.each do |key, values|
  method = EducationalMethod.create(name: key)
  values.each do |name, description|
    method.activity_forms.build(name: name, description: description).save
  end
end

puts "Tworzenie zalet."

%w(spokojny altruista ambitny pokorny posłuszny rozsądny łagodny wychowany hojny cierpliwy nieśmiały uczciwy inteligentny odpowiedzialny obowiązkowy silny odważny optymista ostrożny oszczędny pobożny ufny przezorny skromny punktualny szlachetny szczery wytrwały zdyscyplinowany samodzielny konsekwentny rycerski systematyczny zwinny przywódca).each do |strength|
  CharacterTrait.create(name: strength, kind: "strength")
end

puts "Tworzenie wad."

%w(agresywny egoista niewymagający arogancki bezczelny bezmyślny brutalny chamski chciwy pochopny śmiały oszust niedouczony lekkomyślny leniwy słaby tchórzliwy pesymista beztroski rozrzutny niewierzący podejrzliwy nieprzygotowany próżny spóźnialski amoralny kłamca niewytrwały rozlazły zależny niekonsekwentny niegodziwy sporadyczny niezdarny podwładny).each do |weakness|
  CharacterTrait.create(name: weakness, kind: "weakness")
end

puts "Tworzenie możliwości."

["współpraca w hufcu", "współpraca z wędrownikami", "współpraca z zuchami", "kwatermistrz w drużynie", "4+ zastępy", "16os. +", "26os. +"].each do |opportunity|
  CharacterTrait.create(name: opportunity, kind: "opportunity")
end

puts "Tworzenie zagrożeń."

["brak instruktora", "< 3zastępy", "< 11os.", "brak współpracy poza drużyną"].each do |threat|
  CharacterTrait.create(name: threat, kind: "threat")
end

puts "Tworzenie powiązań cech z formami pracy."

{
  "spokojny" => ["wyczyn", "bieg na orientacje", "podchody"],
  "altruista" => ["służba", "gazetka", "wystawka", "warsztaty"],
  "ambitny" => ["wyczyn", "bieg", "kurs"],
  "pokorny" => ["pełnienie funkcji", "służba"],
  "posłuszny" => ["pełnienie funkcji", "warsztaty", "pionierka"],
  "rozsądny" => ["pełnienie funkcji", "warsztaty", "gra gospodarcza", "akcje zarobkowe"],
  "łagodny" => ["służba", "rozmowa", "stopnie i sprawności"],
  "wychowany" => ["harc/ próba charakteru", "służba"],
  "hojny" => ["harc/ próba charakteru", "gra gospodarcza", "akcje zarobkowe"],
  "cierpliwy" => ["harc/ próba charakteru", "KIM", "krzyżówka", "podchody"],
  "nieśmiały" => ["harc/ próba charakteru", "pełnienie funkcji", "warsztaty", "rozmowa"],
  "uczciwy" => ["gra gospodarcza", "rozmowa", "warty"],
  "inteligentny" => ["krzyżówka", "KIM", "gazetka", "wystawka", "akcje zarobkowe", "zwiad", "quiz"],
  "odpowiedzialny" => ["akcje zarobkowe", "zwiad", "pełnienie funkcji"],
  "obowiązkowy" => ["pełnienie funkcji", "warty", "służba", "kurs"],
  "silny" => ["bieg", "bieg na orientacje", "zawody sportowe", "wyczyn"],
  "odważny" => ["harc/ próba charakteru", "wyczyn"],
  "optymista" => ["harc/ próba charakteru", "rozmowa", "warsztaty"],
  "agresywny" => ["wyczyn", "bieg na orientacje", "podchody"],
  "egoista" => ["służba", "gazetka", "wystawka", "warsztaty"],
  "niewymagający" => ["wyczyn", "bieg", "kurs"],
  "arogancki" => ["pełnienie funkcji", "służba"],
  "bezczelny" => ["pełnienie funkcji", "warsztaty", "pionierka"],
  "bezmyślny" => ["pełnienie funkcji", "warsztaty", "gra gospodarcza", "akcje zarobkowe"],
  "brutalny" => ["służba", "rozmowa", "stopnie i sprawności"],
  "chamski" => ["harc/ próba charakteru", "służba"],
  "chciwy" => ["harc/ próba charakteru", "gra gospodarcza", "akcje zarobkowe"],
  "pochopny" => ["harc/ próba charakteru", "KIM", "krzyżówka", "podchody"],
  "śmiały" => ["harc/ próba charakteru", "pełnienie funkcji", "warsztaty", "rozmowa"],
  "oszust" => ["gra gospodarcza", "rozmowa", "warty"],
  "niedouczony" => ["krzyżówka", "KIM", "gazetka", "wystawka", "akcje zarobkowe", "zwiad", "quiz"],
  "lekkomyślny" => ["akcje zarobkowe", "zwiad", "pełnienie funkcji"],
  "leniwy" => ["pełnienie funkcji", "warty", "służba", "kurs"],
  "słaby" => ["bieg", "bieg na orientacje", "zawody sportowe", "wyczyn"],
  "tchórzliwy" => ["harc/ próba charakteru", "wyczyn"],
  "pesymista" => ["harc/ próba charakteru", "rozmowa", "warsztaty"],
  "ostrożny" => ["podchody"],
  "oszczędny" => ["harc/ próba charakteru", "gra gospodarcza", "akcje zarobkowe"],
  "pobożny" => ["rozmowa", "warsztaty", "służba"],
  "ufny" => ["rozmowa"],
  "przezorny" => ["harc/ próba charakteru", "kurs", "bieg", "bieg na orientacje"],
  "skromny" => ["służba", "pełnienie funkcji"],
  "punktualny" => ["harc/ próba charakteru", "warty", "gazetka", "wystawka"],
  "szlachetny" => ["harc/ próba charakteru", "służba"],
  "szczery" => ["harc/ próba charakteru", "służba", "quiz"],
  "wytrwały" => ["bieg", "bieg na orientacje", "pionierka", "wyczyn"],
  "zdyscyplinowany" => ["pełnienie funkcji", "warty"],
  "samodzielny" => ["harc/ próba charakteru", "bieg", "bieg na orientacje", "zwiad", "wyczyn"],
  "konsekwentny" => ["harc/ próba charakteru", "służba", "pełnienie funkcji"],
  "rycerski" => ["służba", "harc/ próba charakteru"],
  "systematyczny" => ["warty", "służba", "pełnienie funkcji", "gazetka", "harc/ próba charakteru"],
  "zwinny" => ["podchody", "zawody sportowe", "bieg na orientacje"],
  "przywódca" => ["pionierka", "warsztaty", "kurs", "pełnienie funkcji"],
  "beztroski" => ["podchody"],
  "rozrzutny" => ["harc/ próba charakteru", "gra gospodarcza", "akcje zarobkowe"],
  "niewierzący" => ["rozmowa", "warsztaty", "służba"],
  "podejrzliwy" => ["rozmowa"],
  "nieprzygotowany" => ["harc/ próba charakteru", "kurs", "bieg", "bieg na orientacje"],
  "próżny" => ["służba", "pełnienie funkcji"],
  "spóźnialski" => ["harc/ próba charakteru", "warty", "gazetka", "wystawka"],
  "amoralny" => ["harc/ próba charakteru", "służba"],
  "kłamca" => ["harc/ próba charakteru", "służba", "quiz"],
  "niewytrwały" => ["bieg", "bieg na orientacje", "pionierka", "wyczyn"],
  "rozlazły" => ["pełnienie funkcji", "warty"],
  "zależny" => ["harc/ próba charakteru", "bieg", "bieg na orientacje", "zwiad", "wyczyn"],
  "niekonsekwentny" => ["harc/ próba charakteru", "służba", "pełnienie funkcji"],
  "niegodziwy" => ["służba", "harc/ próba charakteru"],
  "sporadyczny" => ["warty", "służba", "pełnienie funkcji", "gazetka", "harc/ próba charakteru"],
  "niezdarny" => ["podchody", "zawody sportowe", "bieg na orientacje"],
  "podwładny" => ["pionierka", "warsztaty", "kurs", "pełnienie funkcji"],
  "współpraca w hufcu" => ["kat. leśna"],
  "współpraca z wędrownikami" => ["kat. leśna"],
  "współpraca z zuchami" => ["kat. leśna"],
  "kwatermistrz w drużynie" => ["kat. leśna"],
  "4+ zastępy" => ["kat. puszczańska"],
  "16os. +" => ["kat. polowa"],
  "26os. +" => ["kat. puszczańska"],
  "brak instruktora" => ["kurs"],
  "< 3zastępy" => ["zaciąg"],
  "< 11os." => ["zaciąg"],
  "brak współpracy poza drużyną" => ["zbiórka_łączona"]
}.each do |character_trait_name, activity_form_names|
  CharacterTrait.find_by(name: character_trait_name).update_attributes(
    activity_form_ids: ActivityForm.where(name: activity_form_names).pluck(:id)
  )
end

puts "Baza danych została wypełniona."
