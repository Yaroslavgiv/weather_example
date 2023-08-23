1. Делаем модель JSON создаем папку model и файлие к модели
2. Создаем папку utilities => constants
3. Создать папку API в ней создать файл weather_api
    - загрузить пакет HTTP
    - создаем папку screens и файл weather_forecast_screen
    - установим пакет flutter_spinkit для красивой иконки загрузки
4. Отображение города и даты
    - создаем папку widgets и файлик city_view
    - установим пакет intl для даты и времени
    - в папке utilities создаем файл forecast_util
    - подключаем виджет CityView  к экрану в WeatherForecastScreen
5. Отображение температуры
    - Создаем файл temp_view в папке widgets
    - реализуем TempView 
    - подключаем виджет TempView к экрану
6. Отображение силы ветра, давления и осадков
    - создаем файл detail_view и класс DetailView
    - подключаем библиотеку font_awesome_flutter для отображения нужной флновой иконки
    - реализуем подгрузку давления в DetailView
    - подключаем виджет DetailView к экрану в WeatherForecastScreen
    - отобразим на экране
    - реализуем осадки и силу ветра в DetailView
7. Создаем файл bottum_list_view 
    - создаем одноимённый класс
    - подключаем виджет к экрану в WeatherForecastScreen
    - создаем виджет forecastCard для отображения карточки прогноза на неделю
    - подключаем дни недели, температуру и иконку
8. Создаем файл city_screen и одноимённый класс
    - реализуем метод onPressed у кнопки выбора города
    - 
9. Создаем файл location_screen и одноимённый класс 
    - подключаем пакет geolocator
    - в папке utilites создаем location с одноимённый класс
    - создаем класс LocationScreen