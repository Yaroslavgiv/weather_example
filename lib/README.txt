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