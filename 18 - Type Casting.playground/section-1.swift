
//====================================================================
//           Defining a Class Hierarchy for Type Casting
//====================================================================

class MediaItem {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

// library type is inferred as [MediaItem]
let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orsen Wells"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

//====================================================================
//                        Checking Type
//====================================================================

var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        ++movieCount
    } else if item is Song {
        ++songCount
    }
}

println("Media library contains \(movieCount) movies and \(songCount) songs.")

//====================================================================
//                         Downcasting
//====================================================================

println()

for item in library {
    if let movie = item as? Movie {
        println("Movie: \(movie.name) - Directed by: \(movie.director)")
    } else if let song = item as? Song {
        println("Song: \(song.name) - Performed by: \(song.artist)")
    }
}

//====================================================================
//                 Type Casting for Any and AnyObject
//====================================================================

println()

// AnyObject
let someObjects = [
    Movie(name: "2001: A Space Odyssey", director: "Stanley Kubrick"),
    Movie(name: "Moon", director: "Duncan Jones"),
    Movie(name: "Alien", director: "Ridley Scott")
]

for object in someObjects {
    let movie = object as Movie
    println("Movie: \(movie.name) - Directed by: \(movie.director)")
}

println()

for movie in someObjects as [Movie] {
    println("Movie: \(movie.name) - Directed by: \(movie.director)")
}

// Any
var things = [Any]()
things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))

println()

for thing in things {
    switch thing {
    case 0 as Int:
        println("Zero as an Int")
    case 0 as Float:
        println("Zero as a Float")
    case 0 as Double:
        println("Zero as a Double")
    case let someInt as Int:
        println("An integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        println("A positive double value of \(someDouble)")
    case is Double:
        println("A double value that I don't want to print")
    case let someString as String:
        println("A string value of \(someString)")
    case let (x, y) as (Double, Double):
        println("An (x, y) point of (\(x), \(y))")
    case let movie as Movie:
        println("A Movie: \(movie.name) - Directed by: \(movie.director)")
    default:
        println("Something else entirely")
    }
}
