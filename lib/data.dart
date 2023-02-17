enum G { lol, dota, csgo, heartstone, pubg, valorant, heroes3, fortnite }

final Map<G, Result> results = {
  G.lol: Result(image: "assets/tile3.jpg", name: "League of Legends"),
  G.dota: Result(image: "assets/tile1.jpg", name: "DOTA 2"),
  G.csgo: Result(image: "assets/tile6.jpg", name: "CS GO"),
  G.heartstone: Result(image: "assets/tile7.jpg", name: "HearthStone"),
  G.pubg: Result(image: "assets/tile2.jpg", name: "PUBG"),
  G.valorant: Result(image: "assets/tile8.jpg", name: "VALORANT"),
  G.heroes3: Result(image: "assets/tile5.jpg", name: "Heroes of Might and Magic III"),
  G.fortnite: Result(image: "assets/tile4.jpg", name: "FORTNITE"),
};


class Result{
  String image;
  String name;
  Result({required this.image, required this.name });
}
const List<QAnswer> all = [
  QAnswer(
      title: "Что ты видишь на этом изображении?",
      image: "assets/quiz/1.jpg",
      items: [
        QItem(text: "Охотничий прицел", value: G.valorant),
        QItem(text: "Мидеры выясняют отношения", value: G.dota),
        QItem(text: "Два Вуконга встретились на красном големе", value: G.lol),
        QItem(text: "Геймеры делят дроп из ящика", value: G.pubg),
        QItem(text: "Тиммейты решают, куда нести Спайк", value: G.heroes3),
        QItem(
            text: "Моя армия пытается пробить ГО из архидьяволов",
            value: G.dota),
        QItem(text: "Это пасхалка от Blizzard!", value: G.heartstone),
        QItem(text: "Что за тупой вопрос?", value: G.fortnite),
      ]),
  QAnswer(
      title: "Какого из этих персонажей ты выберешь в качестве тиммейта?",
      image: "assets/quiz/2.jpg",
      items: [
        QItem(text: "1", value: G.lol),
        QItem(text: "2", value: G.dota),
        QItem(text: "3", value: G.csgo),
        QItem(text: "4", value: G.heartstone),
        QItem(text: "5", value: G.pubg),
        QItem(text: "6", value: G.valorant),
        QItem(text: "7", value: G.heroes3),
        QItem(text: "8", value: G.fortnite),
      ]),
  QAnswer(
      title:
          "У тебя был худший день в году. Что из этого ты наверняка сделаешь вечером?",
      image: "assets/quiz/3.jpg",
      items: [
        QItem(text: "Буду играть с друзьями", value: G.fortnite),
        QItem(
            text: "Пойду знакомиться с мамами оппонентов в чате",
            value: G.pubg),
        QItem(text: "Включу хорошую музыку и спокойно поиграю", value: G.lol),
        QItem(
            text:
                "Выпишу несколько хедшотов виртуальным противникам и успокоюсь",
            value: G.csgo),
        QItem(
            text: "Сделаю несколько спонтанных покупок скинов",
            value: G.valorant),
        QItem(text: "Посмотрю стрим и поиграю в сингл", value: G.dota),
        QItem(
            text:
                "Пойду гулять и развлекаться с друзьями, никакого комплюхтера сегодня",
            value: G.fortnite),
        QItem(text: "Буду сидеть в тильте весь вечер", value: G.heartstone),
      ]),
  
  QAnswer(
      title:
          "Перед тобой несколько предметов, которые не предназначены для сражений, но всё-таки с их помощью можно кому-нибудь накостылять. Взять можно только один. Какой выберешь для самообороны?",
      image: "assets/quiz/4.jpg",
      items: [
        QItem(text: "Сковородка", value: G.pubg),
        QItem(text: "Книга", value: G.heartstone),
        QItem(text: "Швейцарский нож", value: G.csgo),
        QItem(text: "Резиновый молот", value: G.fortnite),
        QItem(text: "Веревка", value: G.lol),
        QItem(text: "Оцинкованное ведро", value: G.valorant),
        QItem(text: "Громкоговоритель", value: G.heroes3),
        QItem(text: "Сидушка унитаза", value: G.dota),
      ]),
  QAnswer(title: "Какой напиток выберешь?", image: "assets/quiz/5.jpg", items: [
    QItem(text: "Пиво", value: G.valorant),
    QItem(text: "Чай", value: G.fortnite),
    QItem(text: "Кофе", value: G.heroes3),
    QItem(text: "Фруктовый сок (вишня, яблоко, ананас и т. п.)", value: G.dota),
    QItem(
        text: "Сложносочиненный коктейль (алкогольный/безалкогольный)",
        value: G.pubg),
    QItem(
        text:
            "Что-нибудь крепкое, но не чай (водка, виски, коньяк, джин и т. п.)",
        value: G.heartstone),
    QItem(text: "Сладкую газировку (Coca-Cola и т. п.)", value: G.lol),
    QItem(text: "Коктейль молотова", value: G.csgo),
  ]),
  QAnswer(
      title:
          "Выбери эмоцию, которую ты отправил бы в чат после того, как оппонент написал/сделал что-то токсичное.",
      image: "assets/quiz/6.jpg",
      items: [
        QItem(text: "1", value: G.heroes3),
        QItem(text: "2", value: G.heartstone),
        QItem(text: "3", value: G.fortnite),
        QItem(text: "4", value: G.pubg),
        QItem(text: "5", value: G.csgo),
        QItem(text: "6", value: G.dota),
        QItem(text: "7", value: G.lol),
        QItem(text: "8", value: G.valorant),
      ]),
  QAnswer(
      title:
          "«Я редко делаю что-то из любопытства». Оцени от 1 до 8 эту фразу, где 1 — совсем не про тебя, а 8 — максимально про тебя.",
      image: "assets/quiz/7.jpg",
      items: [
        QItem(text: "1", value: G.csgo),
        QItem(text: "2", value: G.pubg),
        QItem(text: "3", value: G.dota),
        QItem(text: "4", value: G.lol),
        QItem(text: "5", value: G.fortnite),
        QItem(text: "6", value: G.valorant),
        QItem(text: "7", value: G.heroes3),
        QItem(text: "8", value: G.heartstone),
      ]),
  QAnswer(
      title:
          "Выбери изображение, которое кажется тебе наиболее привлекательным.",
      image: "assets/quiz/8.jpg",
      items: [
        QItem(text: "1", value: G.fortnite),
        QItem(text: "2", value: G.lol),
        QItem(text: "3", value: G.heartstone),
        QItem(text: "4", value: G.pubg),
        QItem(text: "5", value: G.valorant),
        QItem(text: "6", value: G.dota),
        QItem(text: "7", value: G.csgo),
        QItem(text: "8", value: G.heroes3),
      ]),
  QAnswer(
      title: "Какая характеристика тебе ближе?",
      image: "assets/quiz/9.jpg",
      items: [
        QItem(text: "Сильный", value: G.heartstone),
        QItem(text: "Смелый", value: G.dota),
        QItem(text: "Умный", value: G.heroes3),
        QItem(text: "Ловкий", value: G.lol),
        QItem(text: "Быстрый", value: G.csgo),
        QItem(text: "Творческий", value: G.valorant),
        QItem(text: "Нейтральный", value: G.fortnite),
        QItem(text: "Находчивый", value: G.pubg),
      ]),
  QAnswer(
      title: "Выбери вариант ответа, который кажется тебе наиболее верным.",
      image: "assets/quiz/10.jpg",
      items: [
        QItem(
            text:
                "В League of Legends играют одни девочки и мальчики, которые больше похожи на девочек",
            value: G.dota),
        QItem(text: "В Dota 2 можно найти несколько отцов", value: G.lol),
        QItem(text: "Скрытый пул существует", value: G.csgo),
        QItem(text: "В Hearthstone подкручивают", value: G.heartstone),
        QItem(text: "Валорант пишется с буквой «к»", value: G.valorant),
        QItem(text: "Кемперы — худший тип игроков", value: G.csgo),
        QItem(text: "Все варианты ответа верные", value: G.heroes3),
        QItem(text: "Ничто из этого не кажется мне верным", value: G.fortnite),
      ]),
  QAnswer(
      title: "Если бы я играл в Dota 2, то был бы...",
      image: "assets/quiz/11.jpg",
      items: [
        QItem(text: "Киберспортсменом", value: G.pubg),
        QItem(text: "Подпивасом", value: G.valorant),
        QItem(text: "Лидером", value: G.dota),
        QItem(text: "Бустером", value: G.csgo),
        QItem(text: "Среднестатистическим игроком", value: G.fortnite),
        QItem(
            text:
                "Олдом, который заходит в игру раз в месяц и размышляет, что раньше было лучше",
            value: G.heroes3),
        QItem(
            text: "О чем ты? Я никогда не стал бы играть в Dota 2",
            value: G.lol),
        QItem(text: "Никем", value: G.heartstone),
      ]),
  QAnswer(
      title:
          "Представь, что у тебя свидание с подругой/другом, знакомство с которой(ым) состоялось в игре. Куда вы пойдете?",
      image: "assets/quiz/12.jpg",
      items: [
        QItem(text: "На смотровую площадку на крыше — там такие виды!", value: G.csgo),
        QItem(text: "В бар с крафтовыми напитками", value: G.dota),
        QItem(text: "В планетарий", value: G.valorant),
        QItem(text: "На пляж, сразу оценю что надо", value: G.pubg),
        QItem(text: "В элитный ресторан", value: G.fortnite),
        QItem(text: "В музей", value: G.heroes3),
        QItem(text: "На каток", value: G.lol),
        QItem(text: "В зоопарк", value: G.heartstone),
      ]),
       QAnswer(
      title: "Каким образом ты обычно решаешь возникающие проблемы?",
      image: "assets/quiz/13.jpg",
      items: [
        QItem(text: "Хитростью", value: G.pubg),
        QItem(text: "Злюсь, но разруливаю все при помощи интеллекта", value: G.dota),
        QItem(text: "Нахожу творческий подход к решению любой проблемы", value: G.heroes3),
        QItem(text: "Прошу друзей или родителей помочь", value: G.csgo),
        QItem(text: "У меня есть деньги. Есть деньги — нет проблем", value: G.fortnite),
        QItem(text: "Использую свой жизненный опыт", value: G.lol),
        QItem(text: "У меня не бывает проблем", value: G.heartstone),
        QItem(text: "Просто игнорирую любую проблему, и она исчезает сама собой", value: G.valorant),
      ]),
       QAnswer(
      title: "От 1 до 8 оцени, насколько ты любишь петь в караоке (где 1 — ненавидишь, а 8 — обожаешь)",
      image: "assets/quiz/14.jpg",
      items: [
        QItem(text: "1", value: G.csgo),
        QItem(text: "2", value: G.dota),
        QItem(text: "3", value: G.pubg),
        QItem(text: "4", value: G.heroes3),
        QItem(text: "5", value: G.fortnite),
        QItem(text: "6", value: G.valorant),
        QItem(text: "7", value: G.heartstone),
        QItem(text: "8", value: G.lol),
      ])
];

class QAnswer {
  final String title;
  final String image;
  final List<QItem> items;

  const QAnswer(
      {required this.title, required this.image, required this.items});
}

class QItem {
  final String text;
  final G value;
  const QItem({required this.text, required this.value});
}

var t = QAnswer(
    title:
        "Перед тобой несколько предметов, которые не предназначены для сражений, но всё-таки с их помощью можно кому-нибудь накостылять. Взять можно только один. Какой выберешь для самообороны?",
    image: "assets/quiz/4.jpg",
    items: [
      QItem(text: "", value: G.pubg),
      QItem(text: "", value: G.heartstone),
      QItem(text: "", value: G.csgo),
      QItem(text: "", value: G.csgo),
      QItem(text: "", value: G.valorant),
      QItem(text: "", value: G.dota),
      QItem(text: "", value: G.fortnite),
      QItem(text: "", value: G.heartstone),
    ]);
