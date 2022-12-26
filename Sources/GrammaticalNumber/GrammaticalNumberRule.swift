//
//  File.swift
//  
//
//  Created by Devran on 31.08.19.
//

import Foundation

public enum GrammaticalNumberRule {
    case plural(_ rule: String, _ replacement: String)
    case singular(_ rule: String, _ replacement: String)
    case irregular(_ singular: String, _ plural: String)
    case uncountable(_ rule: String)
    
    public static var defaultLanguage = "en"
    
    public static func add(_ rule: GrammaticalNumberRule, language: String = defaultLanguage) {
        if rules[language] == nil {
            rules[language] = []
        }
        rules[language]?.append(rule)
    }
    
    public static func clear() {
        rules = [:]
    }
    
    public static var rules: [String: [GrammaticalNumberRule]] = [
        defaultLanguage: [
            .plural(#"$"#, "s"),
            .plural(#"s$"#, "s"),
            .plural(#"^(ax|test)is$"#, #"$1es"#),
            .plural(#"(octop|vir)us$"#, #"$1i"#),
            .plural(#"(octop|vir)i$"#, #"$1i"#),
            .plural(#"(alias|status)$"#, #"$1es"#),
            .plural(#"(bu)s$"#, #"$1ses"#),
            .plural(#"(buffal|tomat)o$"#, #"$1oes"#),
            .plural(#"([ti])um$"#, #"$1a"#),
            .plural(#"([ti])a$"#, #"$1a"#),
            .plural(#"sis$"#, "ses"),
            .plural(#"(?:([^f])fe|([lr])f)$"#, #"$1$2ves"#),
            .plural(#"(hive)$"#, #"$1s"#),
            .plural(#"([^aeiouy]|qu)y$"#, #"$1ies"#),
            .plural(#"(x|ch|ss|sh)$"#, #"$1es"#),
            .plural(#"(matr|vert|ind)(?:ix|ex)$"#, #"$1ices"#),
            .plural(#"^(m|l)ouse$"#, #"$1ice"#),
            .plural(#"^(m|l)ice$"#, #"$1ice"#),
            .plural(#"^(ox)$"#, #"$1en"#),
            .plural(#"^(oxen)$"#, #"$1"#),
            .plural(#"(quiz)$"#, #"$1zes"#),
            
            .singular(#"s$"#, ""),
            .singular(#"(ss)$"#, #"$1"#),
            .singular(#"(n)ews$"#, #"$1ews"#),
            .singular(#"([ti])a$"#, #"$1um"#),
            .singular(#"((a)naly|(b)a|(d)iagno|(p)arenthe|(p)rogno|(s)ynop|(t)he)(sis|ses)$"#, #"$1sis"#),
            .singular(#"(^analy)(sis|ses)$"#, #"$1sis"#),
            .singular(#"([^f])ves$"#, #"$1fe"#),
            .singular(#"(hive)s$"#, #"$1"#),
            .singular(#"(tive)s$"#, #"$1"#),
            .singular(#"([lr])ves$"#, #"$1f"#),
            .singular(#"([^aeiouy]|qu)ies$"#, #"$1y"#),
            .singular(#"(s)eries$"#, #"$1eries"#),
            .singular(#"(m)ovies$"#, #"$1ovie"#),
            .singular(#"(x|ch|ss|sh)es$"#, #"$1"#),
            .singular(#"^(m|l)ice$"#, #"$1ouse"#),
            .singular(#"(bus)(es)?$"#, #"$1"#),
            .singular(#"(o)es$"#, #"$1"#),
            .singular(#"(shoe)s$"#, #"$1"#),
            .singular(#"(cris|test)(is|es)$"#, #"$1is"#),
            .singular(#"^(a)x[ie]s$"#, #"$1xis"#),
            .singular(#"(octop|vir)(us|i)$"#, #"$1us"#),
            .singular(#"(alias|status)(es)?$"#, #"$1"#),
            .singular(#"^(ox)en"#, #"$1"#),
            .singular(#"(vert|ind)ices$"#, #"$1ex"#),
            .singular(#"(matr)ices$"#, #"$1ix"#),
            .singular(#"(quiz)zes$"#, #"$1"#),
            .singular(#"(database)s$"#, #"$1"#),
            
            .irregular("person", "people"),
            .irregular("man", "men"),
            .irregular("child", "children"),
            .irregular("sex", "sexes"),
            .irregular("move", "moves"),
            .irregular("zombie", "zombies"),
            .irregular("radius", "radii"),
            .irregular("tooth", "teeth"),
            .irregular("goose", "geese"),
            
            .uncountable("equipment"),
            .uncountable("information"),
            .uncountable("rice"),
            .uncountable("money"),
            .uncountable("species"),
            .uncountable("series"),
            .uncountable("fish"),
            .uncountable("sheep"),
            .uncountable("jeans"),
            .uncountable("police")
        ],
        "pt-br": [
            .irregular("chapéu", "chapéus"),
            .irregular("álcool", "álcoois"),
            .irregular("anel", "anéis"),
            .irregular("cônsul", "cônsules"),
            .irregular("têxtil", "têxteis"),
            .irregular("sol", "sóis"),
            .irregular("rouxinol", "rouxinóis"),
            .irregular("mel", "méis"),
            .irregular("raiz", "raízes"),
            
            .plural(#"(le|avi)ão"#, #"$1ões"#),
            .plural(#"(c|p|capit|alem)ão"#, #"$1ães"#),
            .plural(#"(m|irm|cidad|gr)ão"#, #"$1ãos"#),
            .plural(#"([A-zÀ-ú]+)(n|r|s|z)$"#, #"$1es"#),
            .plural(#"([A-zÀ-ú]+)m$"#, #"$1ns"#),
            .plural(#"([A-zÀ-ú]+)l$"#, #"$1is"#),
            .plural(#"([A-zÀ-ú]+)[aeiou]$"#, #"$1s"#),
            
            .singular(#"(le|avi)ões"#, #"$1ão"#), 
            .singular(#"(m|irm)ãos"#, #"$1ão"#),
            .singular(#"(c|p)ães"#, #"$1ão"#),
            .singular(#"([A-z]+)es"#, #"$1"#),
            .singular(#"([A-zÀ-ú]+)ns"#, #"$1m"#),
            .singular(#"(far)óis"#, #"$1ol"#),
            .singular(#"(pap)éis"#, #"$1el"#),
            .singular(#"([A-z]+)is"#, #"$1l"#),
            
            .uncountable("oásis"),
            .uncountable("lápis"),
            .uncountable("lápis"),  
            .uncountable("vírus"),
            .uncountable("costas"),
            .uncountable("calças"),
            .uncountable("parabéns"),
        ]
    ]
}
