

import Foundation
protocol AppStoreProtocol {

    func removeApp(_ appToRemove: App)

    func getAppsByType(_ type: AppType) -> [App]

    func getSortedApps(_ sortingClosure: ([App]) -> [App]) -> [App]

    func validateApp(_ app: App) -> Bool
 
    var apps: [App] { get set }
    
}
enum AppType {
    case delivery
    case sport
    case videoMaking
    case music
}
protocol AppProtocol {
    var name: String { get set }
    var country: String { get set }
    var company: String? { get set }
    var memory: Double { get set }
    var type: AppType { get set }
}

/// Структура создана правильно
struct App: AppProtocol{
    var name: String
    var country: String
    /// Изменили тип `company` в опциональную строку
    var company: String?
    var memory: Double
    var type: AppType
}

class AppStore: AppStoreProtocol {
    
    ///  Массив из всех приложений, изначально пусть будет пустым
    var apps: [App] = []
    
    /// Метод init(), обязательный для классов
    init() {
        
    }
    
    /// Метод добавления приложения
    func addApp(newApp: App) {
        // TODO: Beka Do It!
        
        /// Если приложение валидно:
        /// ```
        /// if приложение валидно, используя метод validateApp {
        ///    В текущий массив добавить новое приложение
        /// }
        /// ```
        /// А если невалидно:
        ///
        // else {
        ///    Выводить в консоль `“Rejected to add an app \(app.name) to AppStore.”`
        /// }
    
        if validateApp(newApp) == true{
            apps.append(newApp)
        }else{
            print("Rejected to add an app \(newApp.name) to AppStore.")
        }
        
    }
    
    func removeApp(_ appToRemove: App) {
        for (key, value) in apps.enumerated(){
            if value.name == appToRemove.name{
                apps.remove(at: key)
            }
        }
        print(apps)
    }
    
    func getAppsByType(_ type: AppType) -> [App] {
        // TODO: Beka Do It!
        var appsArray = apps.filter({ $0.type == type})
        
  print(appsArray)
        return appsArray
        
    }
    
    func getSortedApps(_ sortingClosure: ([App]) -> [App] = { application in
        var total = application.sorted(by: {$0.memory > $1.memory})
        return total
    }) -> [App] {
        
        sortingClosure(apps)
        // TODO: Beka Do It!
         
        /// Видео с 3го урока по очень похожей функции (таймкод указан тоже):
        /// https://youtu.be/aWUkRAUyyho?si=oWklczJOsbFmKGHj&t=1442
    print(sortingClosure(apps))
        return sortingClosure(apps)
    }
    
    /// Метод `validateApp()` должен возвращать `Bool`, если приложение валидно – `true`, если нет – `false`. Критерии валидности:
    /// Приложение весит больше 20 и меньше 3000 МБ и страна разработчика не КНДР и Россия.
    ///
    /// Возвращать булевое значение по условиям, описанным выше
    func validateApp(_ app: App) -> Bool {
        if app.memory > 3000 {
            return false
        }
        if app.memory < 20 {
            return false
        }
        if app.country == "Россия"{
            return false
        }
        if app.country == "КНДР"{
            return false
        }
       
        return true
       
        
        
    }
}
var shazam = App(name: "Shazam", country: "USA", memory: 2005, type: .music)
var doorDash = App(name: "DoorDash", country: "USA", memory: 10, type: .delivery)
var spotiFy = App(name: "SpotiFy", country: "Россия", memory: 25, type: .music)
var fitJab = App(name: "FitJab", country: "UAE", memory: 25, type: .sport)
var capCut = App(name: "CapCut", country: "CHINA", memory: 33, type: .videoMaking)
var fitBek = App(name: "FitBek", country: "KR", memory: 25, type: .sport)
var allApps = AppStore()
allApps.addApp(newApp: shazam)
allApps.addApp(newApp: fitJab)
allApps.addApp(newApp: doorDash)
allApps.addApp(newApp: fitBek)

allApps.removeApp(shazam)
