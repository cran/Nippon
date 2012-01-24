/*
 * KAKASI (Kanji Kana Simple inversion program)
 * $Id: hh2.c,v 1.15 2006-09-21 07:51:12 knok Exp $
 * Copyright (C) 1992
 * Hironobu Takahashi (takahasi@tiny.or.jp)
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either versions 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with KAKASI, see the file COPYING.  If not, write to the Free
 * Software Foundation Inc., 59 Temple Place - Suite 330, Boston, MA
 * 02111-1307, USA.
 */

#ifdef HAVE_CONFIG_H
# include <config.h>
#endif

#include <stdio.h>
#ifdef HAVE_STRING_H
# include <string.h>
#else
# include <strings.h>
#endif
#include "kakasi.h"

struct H2rom_tbl {
    unsigned char kana[10];
    char romaji[7];
}
H2rom_h_table_old[] = { 

    {"\244\241", "a"}, {"\244\242", "a"},
    {"\244\243", "i"}, {"\244\244", "i"},
    {"\244\245", "u"}, {"\244\246", "u"},
    {"\244\246\241\253", "vu"}, {"\244\246\241\253\244\241", "va"},
    {"\244\246\241\253\244\243", "vi"}, {"\244\246\241\253\244\247", "ve"},
    {"\244\246\241\253\244\251", "vo"}, {"\244\247", "e"}, {"\244\250", "e"},
    {"\244\251", "o"}, {"\244\252", "o"},

    {"\244\253", "ka"}, {"\244\254", "ga"},
    {"\244\255", "ki"}, {"\244\255\244\343", "kya"},
    {"\244\255\244\345", "kyu"}, {"\244\255\244\347", "kyo"},
    {"\244\256", "gi"}, {"\244\256\244\343", "gya"},
    {"\244\256\244\345", "gyu"}, {"\244\256\244\347", "gyo"},
    {"\244\257", "ku"}, {"\244\260", "gu"},
    {"\244\261", "ke"}, {"\244\262", "ge"},
    {"\244\263", "ko"}, {"\244\264", "go"},

    {"\244\265", "sa"}, {"\244\266", "za"},
    {"\244\267", "shi"}, {"\244\267\244\343", "sha"},
    {"\244\267\244\345", "shu"}, {"\244\267\244\347", "sho"},
    {"\244\270", "ji"}, {"\244\270\244\343", "ja"},
    {"\244\270\244\345", "ju"}, {"\244\270\244\347", "jo"},
    {"\244\271", "su"}, {"\244\272", "zu"},
    {"\244\273", "se"}, {"\244\274", "ze"},
    {"\244\275", "so"}, {"\244\276", "zo"},

    {"\244\277", "ta"}, {"\244\300", "da"},
    {"\244\301", "chi"}, {"\244\301\244\343", "cha"},
    {"\244\301\244\345", "chu"}, {"\244\301\244\347", "cho"},
    {"\244\302", "di"}, {"\244\302\244\343", "dya"},
    {"\244\302\244\345", "dyu"}, {"\244\302\244\347", "dyo"},
    {"\244\303", "tsu"}, {"\244\303\244\246\241\253", "vvu"},
    {"\244\303\244\246\241\253\244\241", "vva"},
    {"\244\303\244\246\241\253\244\243", "vvi"},
    {"\244\303\244\246\241\253\244\247", "vve"},
    {"\244\303\244\246\241\253\244\251", "vvo"},
    {"\244\303\244\253", "kka"}, {"\244\303\244\254", "gga"},
    {"\244\303\244\255", "kki"}, {"\244\303\244\255\244\343", "kkya"},
    {"\244\303\244\255\244\345", "kkyu"}, {"\244\303\244\255\244\347", "kkyo"},
    {"\244\303\244\256", "ggi"}, {"\244\303\244\256\244\343", "ggya"},
    {"\244\303\244\256\244\345", "ggyu"}, {"\244\303\244\256\244\347", "ggyo"},
    {"\244\303\244\257", "kku"}, {"\244\303\244\260", "ggu"},
    {"\244\303\244\261", "kke"}, {"\244\303\244\262", "gge"},
    {"\244\303\244\263", "kko"}, {"\244\303\244\264", "ggo"},
    {"\244\303\244\265", "ssa"}, {"\244\303\244\266", "zza"},
    {"\244\303\244\267", "sshi"}, {"\244\303\244\267\244\343", "ssha"},
    {"\244\303\244\267\244\345", "sshu"}, {"\244\303\244\267\244\347", "ssho"},
    {"\244\303\244\270", "jji"}, {"\244\303\244\270\244\343", "jja"},
    {"\244\303\244\270\244\345", "jju"}, {"\244\303\244\270\244\347", "jjo"},
    {"\244\303\244\271", "ssu"}, {"\244\303\244\272", "zzu"},
    {"\244\303\244\273", "sse"}, {"\244\303\244\274", "zze"},
    {"\244\303\244\275", "sso"}, {"\244\303\244\276", "zzo"},
    {"\244\303\244\277", "tta"}, {"\244\303\244\300", "dda"},
    {"\244\303\244\301", "cchi"}, {"\244\303\244\301\244\343", "ccha"},
    {"\244\303\244\301\244\345", "cchu"}, {"\244\303\244\301\244\347", "ccho"},
    {"\244\303\244\302", "ddi"}, {"\244\303\244\302\244\343", "ddya"},
    {"\244\303\244\302\244\345", "ddyu"}, {"\244\303\244\302\244\347", "ddyo"},
    {"\244\303\244\304", "ttsu"}, {"\244\303\244\305", "ddu"},
    {"\244\303\244\306", "tte"}, {"\244\303\244\307", "dde"},
    {"\244\303\244\310", "tto"}, {"\244\303\244\311", "ddo"},
    {"\244\303\244\317", "hha"}, {"\244\303\244\320", "bba"},
    {"\244\303\244\321", "ppa"},
    {"\244\303\244\322", "hhi"}, {"\244\303\244\322\244\343", "hhya"},
    {"\244\303\244\322\244\345", "hhyu"}, {"\244\303\244\322\244\347", "hhyo"},
    {"\244\303\244\323", "bbi"}, {"\244\303\244\323\244\343", "bbya"},
    {"\244\303\244\323\244\345", "bbyu"}, {"\244\303\244\323\244\347", "bbyo"},
    {"\244\303\244\324", "ppi"}, {"\244\303\244\324\244\343", "ppya"},
    {"\244\303\244\324\244\345", "ppyu"}, {"\244\303\244\324\244\347", "ppyo"},
    {"\244\303\244\325", "ffu"}, {"\244\303\244\325\244\241", "ffa"},
    {"\244\303\244\325\244\243", "ffi"}, {"\244\303\244\325\244\247", "ffe"},
    {"\244\303\244\325\244\251", "ffo"},
    {"\244\303\244\326", "bbu"}, {"\244\303\244\327", "ppu"},
    {"\244\303\244\330", "hhe"}, {"\244\303\244\331", "bbe"},
    {"\244\303\244\332", "ppe"},
    {"\244\303\244\333", "hho"}, {"\244\303\244\334", "bbo"},
    {"\244\303\244\335", "ppo"},
    {"\244\303\244\344", "yya"}, {"\244\303\244\346", "yyu"},
    {"\244\303\244\350", "yyo"},
    {"\244\303\244\351", "rra"}, {"\244\303\244\352", "rri"},
    {"\244\303\244\352\244\343", "rrya"}, {"\244\303\244\352\244\345", "rryu"},
    {"\244\303\244\352\244\347", "rryo"},
    {"\244\303\244\353", "rru"}, {"\244\303\244\354", "rre"},
    {"\244\303\244\355", "rro"},

    {"\244\304", "tsu"}, {"\244\305", "du"},
    {"\244\306", "te"}, {"\244\307", "de"},
    {"\244\310", "to"}, {"\244\311", "do"},

    {"\244\312", "na"},
    {"\244\313", "ni"}, {"\244\313\244\343", "nya"},
    {"\244\313\244\345", "nyu"}, {"\244\313\244\347", "nyo"},
    {"\244\314", "nu"}, {"\244\315", "ne"}, {"\244\316", "no"},

    {"\244\317", "ha"}, {"\244\320", "ba"}, {"\244\321", "pa"},
    {"\244\322", "hi"}, {"\244\322\244\343", "hya"},
    {"\244\322\244\345", "hyu"}, {"\244\322\244\347", "hyo"},
    {"\244\323", "bi"}, {"\244\323\244\343", "bya"},
    {"\244\323\244\345", "byu"}, {"\244\323\244\347", "byo"},
    {"\244\324", "pi"}, {"\244\324\244\343", "pya"},
    {"\244\324\244\345", "pyu"}, {"\244\324\244\347", "pyo"},
    {"\244\325", "fu"}, {"\244\325\244\241", "fa"},
    {"\244\325\244\243", "fi"}, {"\244\325\244\247", "fe"},
    {"\244\325\244\251", "fo"},
    {"\244\326", "bu"}, {"\244\327", "pu"},
    {"\244\330", "he"}, {"\244\331", "be"}, {"\244\332", "pe"},
    {"\244\333", "ho"}, {"\244\334", "bo"}, {"\244\335", "po"},

    {"\244\336", "ma"},
    {"\244\337", "mi"}, {"\244\337\244\343", "mya"},
    {"\244\337\244\345", "myu"}, {"\244\337\244\347", "myo"},
    {"\244\340", "mu"}, {"\244\341", "me"}, {"\244\342", "mo"},

    {"\244\343", "ya"}, {"\244\344", "ya"},
    {"\244\345", "yu"}, {"\244\346", "yu"},
    {"\244\347", "yo"}, {"\244\350", "yo"},

    {"\244\351", "ra"},
    {"\244\352", "ri"}, {"\244\352\244\343", "rya"},
    {"\244\352\244\345", "ryu"}, {"\244\352\244\347", "ryo"},
    {"\244\353", "ru"}, {"\244\354", "re"}, {"\244\355", "ro"},

    {"\244\356", "wa"}, {"\244\357", "wa"},
    {"\244\360", "i"}, {"\244\361", "e"}, 
    {"\244\362", "wo"}, {"\244\363", "n"},

    {"\244\363\244\242", "n'a"}, {"\244\363\244\244", "n'i"},
    {"\244\363\244\246", "n'u"}, {"\244\363\244\250", "n'e"},
    {"\244\363\244\252", "n'o"},

    {"", ""},

}, H2rom_h_table[] = { 

    {"\244\241", "a"}, {"\244\242", "a"},
    {"\244\243", "i"}, {"\244\244", "i"},
    {"\244\245", "u"}, {"\244\246", "u"},
    {"\244\246\241\253", "vu"}, {"\244\246\241\253\244\241", "va"},
    {"\244\246\241\253\244\243", "vi"}, {"\244\246\241\253\244\247", "ve"},
    {"\244\246\241\253\244\251", "vo"},
    {"\244\247", "e"}, {"\244\250", "e"},
    {"\244\251", "o"}, {"\244\252", "o"},

    {"\244\253", "ka"}, {"\244\254", "ga"},
    {"\244\255", "ki"}, {"\244\255\244\343", "kya"},
    {"\244\255\244\345", "kyu"}, {"\244\255\244\347", "kyo"},
    {"\244\256", "gi"}, {"\244\256\244\343", "gya"},
    {"\244\256\244\345", "gyu"}, {"\244\256\244\347", "gyo"},
    {"\244\257", "ku"}, {"\244\260", "gu"},
    {"\244\261", "ke"}, {"\244\262", "ge"},
    {"\244\263", "ko"}, {"\244\264", "go"},

    {"\244\265", "sa"}, {"\244\266", "za"},
    {"\244\267", "shi"}, {"\244\267\244\343", "sha"},
    {"\244\267\244\345", "shu"}, {"\244\267\244\347", "sho"},
    {"\244\270", "ji"}, {"\244\270\244\343", "ja"},
    {"\244\270\244\345", "ju"}, {"\244\270\244\347", "jo"},
    {"\244\271", "su"}, {"\244\272", "zu"},
    {"\244\273", "se"}, {"\244\274", "ze"},
    {"\244\275", "so"}, {"\244\276", "zo"},

    {"\244\277", "ta"}, {"\244\300", "da"},
    {"\244\301", "chi"}, {"\244\301\244\247", "che"}, {"\244\301\244\343", "cha"},
    {"\244\301\244\345", "chu"}, {"\244\301\244\347", "cho"},
    {"\244\302", "ji"}, {"\244\302\244\343", "ja"},
    {"\244\302\244\345", "ju"}, {"\244\302\244\347", "jo"},

    {"\244\303", "tsu"},
    {"\244\303\244\246\241\253", "vvu"},
    {"\244\303\244\246\241\253\244\241", "vva"},
    {"\244\303\244\246\241\253\244\243", "vvi"},
    {"\244\303\244\246\241\253\244\247", "vve"},
    {"\244\303\244\246\241\253\244\251", "vvo"},
    {"\244\303\244\253", "kka"}, {"\244\303\244\254", "gga"},
    {"\244\303\244\255", "kki"}, {"\244\303\244\255\244\343", "kkya"},
    {"\244\303\244\255\244\345", "kkyu"}, {"\244\303\244\255\244\347", "kkyo"},
    {"\244\303\244\256", "ggi"}, {"\244\303\244\256\244\343", "ggya"},
    {"\244\303\244\256\244\345", "ggyu"}, {"\244\303\244\256\244\347", "ggyo"},
    {"\244\303\244\257", "kku"}, {"\244\303\244\260", "ggu"},
    {"\244\303\244\261", "kke"}, {"\244\303\244\262", "gge"},
    {"\244\303\244\263", "kko"}, {"\244\303\244\264", "ggo"},
    {"\244\303\244\265", "ssa"}, {"\244\303\244\266", "zza"},
    {"\244\303\244\267", "sshi"}, {"\244\303\244\267\244\343", "ssha"},
    {"\244\303\244\267\244\345", "sshu"}, {"\244\303\244\267\244\347", "ssho"},
    {"\244\303\244\270", "jji"}, {"\244\303\244\270\244\343", "jja"},
    {"\244\303\244\270\244\345", "jju"}, {"\244\303\244\270\244\347", "jjo"},
    {"\244\303\244\271", "ssu"}, {"\244\303\244\272", "zzu"},
    {"\244\303\244\273", "sse"}, {"\244\303\244\274", "zze"},
    {"\244\303\244\275", "sso"}, {"\244\303\244\276", "zzo"},
    {"\244\303\244\277", "tta"}, {"\244\303\244\300", "dda"},
    {"\244\303\244\301", "tchi"}, {"\244\303\244\301\244\343", "tcha"},
    {"\244\303\244\301\244\345", "tchu"}, {"\244\303\244\301\244\347", "tcho"},
    {"\244\303\244\302", "jji"}, {"\244\303\244\302\244\343", "jjya"},
    {"\244\303\244\302\244\345", "jjyu"}, {"\244\303\244\302\244\347", "jjyo"},
    {"\244\303\244\304", "ttsu"}, {"\244\303\244\305", "zzu"},
    {"\244\303\244\306", "tte"}, {"\244\303\244\307", "dde"},
    {"\244\303\244\310", "tto"}, {"\244\303\244\311", "ddo"},
    {"\244\303\244\317", "hha"}, {"\244\303\244\320", "bba"},
    {"\244\303\244\321", "ppa"},
    {"\244\303\244\322", "hhi"}, {"\244\303\244\322\244\343", "hhya"},
    {"\244\303\244\322\244\345", "hhyu"}, {"\244\303\244\322\244\347", "hhyo"},
    {"\244\303\244\323", "bbi"}, {"\244\303\244\323\244\343", "bbya"},
    {"\244\303\244\323\244\345", "bbyu"}, {"\244\303\244\323\244\347", "bbyo"},
    {"\244\303\244\324", "ppi"}, {"\244\303\244\324\244\343", "ppya"},
    {"\244\303\244\324\244\345", "ppyu"}, {"\244\303\244\324\244\347", "ppyo"},
    {"\244\303\244\325", "ffu"}, {"\244\303\244\325\244\241", "ffa"},
    {"\244\303\244\325\244\243", "ffi"}, {"\244\303\244\325\244\247", "ffe"},
    {"\244\303\244\325\244\251", "ffo"},
    {"\244\303\244\326", "bbu"}, {"\244\303\244\327", "ppu"},
    {"\244\303\244\330", "hhe"}, {"\244\303\244\331", "bbe"},
    {"\244\303\244\332", "ppe"},
    {"\244\303\244\333", "hho"}, {"\244\303\244\334", "bbo"},
    {"\244\303\244\335", "ppo"},
    {"\244\303\244\344", "yya"}, {"\244\303\244\346", "yyu"},
    {"\244\303\244\350", "yyo"},
    {"\244\303\244\351", "rra"}, {"\244\303\244\352", "rri"},
    {"\244\303\244\352\244\343", "rrya"}, {"\244\303\244\352\244\345", "rryu"},
    {"\244\303\244\352\244\347", "rryo"},
    {"\244\303\244\353", "rru"}, {"\244\303\244\354", "rre"},
    {"\244\303\244\355", "rro"},

    {"\244\304", "tsu"}, {"\244\305", "zu"},
    {"\244\306", "te"}, {"\244\307", "de"}, {"\244\307\244\243", "di"},
    {"\244\310", "to"}, {"\244\311", "do"},

    {"\244\312", "na"},
    {"\244\313", "ni"}, {"\244\313\244\343", "nya"},
    {"\244\313\244\345", "nyu"}, {"\244\313\244\347", "nyo"},
    {"\244\314", "nu"}, {"\244\315", "ne"}, {"\244\316", "no"},

    {"\244\317", "ha"}, {"\244\320", "ba"}, {"\244\321", "pa"},
    {"\244\322", "hi"}, {"\244\322\244\343", "hya"},
    {"\244\322\244\345", "hyu"}, {"\244\322\244\347", "hyo"},
    {"\244\323", "bi"}, {"\244\323\244\343", "bya"},
    {"\244\323\244\345", "byu"}, {"\244\323\244\347", "byo"},
    {"\244\324", "pi"}, {"\244\324\244\343", "pya"},
    {"\244\324\244\345", "pyu"}, {"\244\324\244\347", "pyo"},
    {"\244\325", "fu"}, {"\244\325\244\241", "fa"},
    {"\244\325\244\243", "fi"}, {"\244\325\244\247", "fe"},
    {"\244\325\244\251", "fo"},
    {"\244\326", "bu"}, {"\244\327", "pu"},
    {"\244\330", "he"}, {"\244\331", "be"}, {"\244\332", "pe"},
    {"\244\333", "ho"}, {"\244\334", "bo"}, {"\244\335", "po"},

    {"\244\336", "ma"},
    {"\244\337", "mi"}, {"\244\337\244\343", "mya"},
    {"\244\337\244\345", "myu"}, {"\244\337\244\347", "myo"},
    {"\244\340", "mu"}, {"\244\341", "me"}, {"\244\342", "mo"},

    {"\244\343", "ya"}, {"\244\344", "ya"},
    {"\244\345", "yu"}, {"\244\346", "yu"},
    {"\244\347", "yo"}, {"\244\350", "yo"},

    {"\244\351", "ra"},
    {"\244\352", "ri"}, {"\244\352\244\343", "rya"},
    {"\244\352\244\345", "ryu"}, {"\244\352\244\347", "ryo"},
    {"\244\353", "ru"}, {"\244\354", "re"}, {"\244\355", "ro"},

    {"\244\356", "wa"}, {"\244\357", "wa"},
    {"\244\360", "i"}, {"\244\361", "e"}, 
    {"\244\362", "wo"}, {"\244\363", "n"},

    {"\244\363\244\242", "n'a"}, {"\244\363\244\244", "n'i"},
    {"\244\363\244\246", "n'u"}, {"\244\363\244\250", "n'e"},
    {"\244\363\244\252", "n'o"},

    {"", ""},

}, H2rom_k_table_old[] = { 

    {"\244\241", "a"}, {"\244\242", "a"},
    {"\244\243", "i"}, {"\244\244", "i"},
    {"\244\245", "u"}, {"\244\246", "u"},
    {"\244\246\241\253", "vu"}, {"\244\246\241\253\244\241", "va"},
    {"\244\246\241\253\244\243", "vi"}, {"\244\246\241\253\244\247", "ve"},
    {"\244\246\241\253\244\251", "vo"},
    {"\244\247", "e"}, {"\244\250", "e"},
    {"\244\251", "o"}, {"\244\252", "o"},

    {"\244\253", "ka"}, {"\244\254", "ga"},
    {"\244\255", "ki"}, {"\244\255\244\343", "kya"},
    {"\244\255\244\345", "kyu"}, {"\244\255\244\347", "kyo"},
    {"\244\256", "gi"}, {"\244\256\244\343", "gya"},
    {"\244\256\244\345", "gyu"}, {"\244\256\244\347", "gyo"},
    {"\244\257", "ku"}, {"\244\260", "gu"},
    {"\244\261", "ke"}, {"\244\262", "ge"},
    {"\244\263", "ko"}, {"\244\264", "go"},

    {"\244\265", "sa"}, {"\244\266", "za"},
    {"\244\267", "si"}, {"\244\267\244\343", "sya"},
    {"\244\267\244\345", "syu"}, {"\244\267\244\347", "syo"},
    {"\244\270", "zi"}, {"\244\270\244\343", "zya"},
    {"\244\270\244\345", "zyu"}, {"\244\270\244\347", "zyo"},
    {"\244\271", "su"}, {"\244\272", "zu"},
    {"\244\273", "se"}, {"\244\274", "ze"},
    {"\244\275", "so"}, {"\244\276", "zo"},

    {"\244\277", "ta"}, {"\244\300", "da"},
    {"\244\301", "ti"}, {"\244\301\244\343", "tya"},
    {"\244\301\244\345", "tyu"}, {"\244\301\244\347", "tyo"},
    {"\244\302", "di"}, {"\244\302\244\343", "dya"},
    {"\244\302\244\345", "dyu"}, {"\244\302\244\347", "dyo"},

    {"\244\303", "tu"},
    {"\244\303\244\246\241\253", "vvu"},
    {"\244\303\244\246\241\253\244\241", "vva"},
    {"\244\303\244\246\241\253\244\243", "vvi"},
    {"\244\303\244\246\241\253\244\247", "vve"},
    {"\244\303\244\246\241\253\244\251", "vvo"},
    {"\244\303\244\253", "kka"}, {"\244\303\244\254", "gga"},
    {"\244\303\244\255", "kki"}, {"\244\303\244\255\244\343", "kkya"},
    {"\244\303\244\255\244\345", "kkyu"}, {"\244\303\244\255\244\347", "kkyo"},
    {"\244\303\244\256", "ggi"}, {"\244\303\244\256\244\343", "ggya"},
    {"\244\303\244\256\244\345", "ggyu"}, {"\244\303\244\256\244\347", "ggyo"},
    {"\244\303\244\257", "kku"}, {"\244\303\244\260", "ggu"},
    {"\244\303\244\261", "kke"}, {"\244\303\244\262", "gge"},
    {"\244\303\244\263", "kko"}, {"\244\303\244\264", "ggo"},
    {"\244\303\244\265", "ssa"}, {"\244\303\244\266", "zza"},
    {"\244\303\244\267", "ssi"}, {"\244\303\244\267\244\343", "ssya"},
    {"\244\303\244\267\244\345", "ssyu"}, {"\244\303\244\267\244\347", "ssho"},
    {"\244\303\244\270", "zzi"}, {"\244\303\244\270\244\343", "zzya"},
    {"\244\303\244\270\244\345", "zzyu"}, {"\244\303\244\270\244\347", "zzyo"},
    {"\244\303\244\271", "ssu"}, {"\244\303\244\272", "zzu"},
    {"\244\303\244\273", "sse"}, {"\244\303\244\274", "zze"},
    {"\244\303\244\275", "sso"}, {"\244\303\244\276", "zzo"},
    {"\244\303\244\277", "tta"}, {"\244\303\244\300", "dda"},
    {"\244\303\244\301", "tti"}, {"\244\303\244\301\244\343", "ttya"},
    {"\244\303\244\301\244\345", "ttyu"}, {"\244\303\244\301\244\347", "ttyo"},
    {"\244\303\244\302", "ddi"}, {"\244\303\244\302\244\343", "ddya"},
    {"\244\303\244\302\244\345", "ddyu"}, {"\244\303\244\302\244\347", "ddyo"},
    {"\244\303\244\304", "ttu"}, {"\244\303\244\305", "ddu"},
    {"\244\303\244\306", "tte"}, {"\244\303\244\307", "dde"},
    {"\244\303\244\310", "tto"}, {"\244\303\244\311", "ddo"},
    {"\244\303\244\317", "hha"}, {"\244\303\244\320", "bba"},
    {"\244\303\244\321", "ppa"},
    {"\244\303\244\322", "hhi"}, {"\244\303\244\322\244\343", "hhya"},
    {"\244\303\244\322\244\345", "hhyu"}, {"\244\303\244\322\244\347", "hhyo"},
    {"\244\303\244\323", "bbi"}, {"\244\303\244\323\244\343", "bbya"},
    {"\244\303\244\323\244\345", "bbyu"}, {"\244\303\244\323\244\347", "bbyo"},
    {"\244\303\244\324", "ppi"}, {"\244\303\244\324\244\343", "ppya"},
    {"\244\303\244\324\244\345", "ppyu"}, {"\244\303\244\324\244\347", "ppyo"},
    {"\244\303\244\325", "hhu"}, {"\244\303\244\325\244\241", "ffa"},
    {"\244\303\244\325\244\243", "ffi"}, {"\244\303\244\325\244\247", "ffe"},
    {"\244\303\244\325\244\251", "ffo"},
    {"\244\303\244\326", "bbu"}, {"\244\303\244\327", "ppu"},
    {"\244\303\244\330", "hhe"}, {"\244\303\244\331", "bbe"},
    {"\244\303\244\332", "ppe"},
    {"\244\303\244\333", "hho"}, {"\244\303\244\334", "bbo"},
    {"\244\303\244\335", "ppo"},
    {"\244\303\244\344", "yya"}, {"\244\303\244\346", "yyu"},
    {"\244\303\244\350", "yyo"},
    {"\244\303\244\351", "rra"}, {"\244\303\244\352", "rri"},
    {"\244\303\244\352\244\343", "rrya"}, {"\244\303\244\352\244\345", "rryu"},
    {"\244\303\244\352\244\347", "rryo"},
    {"\244\303\244\353", "rru"}, {"\244\303\244\354", "rre"},
    {"\244\303\244\355", "rro"},

    {"\244\304", "tu"}, {"\244\305", "du"},
    {"\244\306", "te"}, {"\244\307", "de"},
    {"\244\310", "to"}, {"\244\311", "do"},

    {"\244\312", "na"},
    {"\244\313", "ni"}, {"\244\313\244\343", "nya"},
    {"\244\313\244\345", "nyu"}, {"\244\313\244\347", "nyo"},
    {"\244\314", "nu"}, {"\244\315", "ne"}, {"\244\316", "no"},

    {"\244\317", "ha"}, {"\244\320", "ba"}, {"\244\321", "pa"},
    {"\244\322", "hi"}, {"\244\322\244\343", "hya"},
    {"\244\322\244\345", "hyu"}, {"\244\322\244\347", "hyo"},
    {"\244\323", "bi"}, {"\244\323\244\343", "bya"},
    {"\244\323\244\345", "byu"}, {"\244\323\244\347", "byo"},
    {"\244\324", "pi"}, {"\244\324\244\343", "pya"},
    {"\244\324\244\345", "pyu"}, {"\244\324\244\347", "pyo"},
    {"\244\325", "hu"}, {"\244\325\244\241", "fa"},
    {"\244\325\244\243", "fi"}, {"\244\325\244\247", "fe"},
    {"\244\325\244\251", "fo"},
    {"\244\326", "bu"}, {"\244\327", "pu"},
    {"\244\330", "he"}, {"\244\331", "be"}, {"\244\332", "pe"},
    {"\244\333", "ho"}, {"\244\334", "bo"}, {"\244\335", "po"},

    {"\244\336", "ma"},
    {"\244\337", "mi"}, {"\244\337\244\343", "mya"},
    {"\244\337\244\345", "myu"}, {"\244\337\244\347", "myo"},
    {"\244\340", "mu"}, {"\244\341", "me"}, {"\244\342", "mo"},

    {"\244\343", "ya"}, {"\244\344", "ya"},
    {"\244\345", "yu"}, {"\244\346", "yu"},
    {"\244\347", "yo"}, {"\244\350", "yo"},

    {"\244\351", "ra"},
    {"\244\352", "ri"}, {"\244\352\244\343", "rya"},
    {"\244\352\244\345", "ryu"}, {"\244\352\244\347", "ryo"},
    {"\244\353", "ru"}, {"\244\354", "re"}, {"\244\355", "ro"},

    {"\244\356", "wa"}, {"\244\357", "wa"},
    {"\244\360", "i"}, {"\244\361", "e"}, 
    {"\244\362", "wo"}, {"\244\363", "n"},

    {"\244\363\244\242", "n'a"}, {"\244\363\244\244", "n'i"},
    {"\244\363\244\246", "n'u"}, {"\244\363\244\250", "n'e"},
    {"\244\363\244\252", "n'o"},

    {"", ""},

}, H2rom_k_table[] = { 

    {"\244\241", "a"}, {"\244\242", "a"},
    {"\244\243", "i"}, {"\244\244", "i"},
    {"\244\245", "u"}, {"\244\246", "u"},
    {"\244\246\241\253", "vu"}, {"\244\246\241\253\244\241", "va"},
    {"\244\246\241\253\244\243", "vi"}, {"\244\246\241\253\244\247", "ve"},
    {"\244\246\241\253\244\251", "vo"},
    {"\244\247", "e"}, {"\244\250", "e"},
    {"\244\251", "o"}, {"\244\252", "o"},

    {"\244\253", "ka"}, {"\244\254", "ga"},
    {"\244\255", "ki"}, {"\244\255\244\343", "kya"},
    {"\244\255\244\345", "kyu"}, {"\244\255\244\347", "kyo"},
    {"\244\256", "gi"}, {"\244\256\244\343", "gya"},
    {"\244\256\244\345", "gyu"}, {"\244\256\244\347", "gyo"},
    {"\244\257", "ku"}, {"\244\260", "gu"},
    {"\244\261", "ke"}, {"\244\262", "ge"},
    {"\244\263", "ko"}, {"\244\264", "go"},

    {"\244\265", "sa"}, {"\244\266", "za"},
    {"\244\267", "si"}, {"\244\267\244\343", "sya"},
    {"\244\267\244\345", "syu"}, {"\244\267\244\347", "syo"},
    {"\244\270", "zi"}, {"\244\270\244\343", "zya"},
    {"\244\270\244\345", "zyu"}, {"\244\270\244\347", "zyo"},
    {"\244\271", "su"}, {"\244\272", "zu"},
    {"\244\273", "se"}, {"\244\274", "ze"},
    {"\244\275", "so"}, {"\244\276", "zo"},

    {"\244\277", "ta"}, {"\244\300", "da"},
    {"\244\301", "ti"}, {"\244\301\244\343", "tya"},
    {"\244\301\244\345", "tyu"}, {"\244\301\244\347", "tyo"},
    {"\244\302", "di"}, {"\244\302\244\343", "dya"},
    {"\244\302\244\345", "dyu"}, {"\244\302\244\347", "dyo"},

    {"\244\303", "tu"},
    {"\244\303\244\246\241\253", "vvu"},
    {"\244\303\244\246\241\253\244\241", "vva"},
    {"\244\303\244\246\241\253\244\243", "vvi"},
    {"\244\303\244\246\241\253\244\247", "vve"},
    {"\244\303\244\246\241\253\244\251", "vvo"},
    {"\244\303\244\253", "kka"}, {"\244\303\244\254", "gga"},
    {"\244\303\244\255", "kki"}, {"\244\303\244\255\244\343", "kkya"},
    {"\244\303\244\255\244\345", "kkyu"}, {"\244\303\244\255\244\347", "kkyo"},
    {"\244\303\244\256", "ggi"}, {"\244\303\244\256\244\343", "ggya"},
    {"\244\303\244\256\244\345", "ggyu"}, {"\244\303\244\256\244\347", "ggyo"},
    {"\244\303\244\257", "kku"}, {"\244\303\244\260", "ggu"},
    {"\244\303\244\261", "kke"}, {"\244\303\244\262", "gge"},
    {"\244\303\244\263", "kko"}, {"\244\303\244\264", "ggo"},
    {"\244\303\244\265", "ssa"}, {"\244\303\244\266", "zza"},
    {"\244\303\244\267", "ssi"}, {"\244\303\244\267\244\343", "ssya"},
    {"\244\303\244\267\244\345", "ssyu"}, {"\244\303\244\267\244\347", "ssyo"},
    {"\244\303\244\270", "zzi"}, {"\244\303\244\270\244\343", "zzya"},
    {"\244\303\244\270\244\345", "zzyu"}, {"\244\303\244\270\244\347", "zzyo"},
    {"\244\303\244\271", "ssu"}, {"\244\303\244\272", "zzu"},
    {"\244\303\244\273", "sse"}, {"\244\303\244\274", "zze"},
    {"\244\303\244\275", "sso"}, {"\244\303\244\276", "zzo"},
    {"\244\303\244\277", "tta"}, {"\244\303\244\300", "dda"},
    {"\244\303\244\301", "tti"}, {"\244\303\244\301\244\343", "ttya"},
    {"\244\303\244\301\244\345", "ttyu"}, {"\244\303\244\301\244\347", "ttyo"},
    {"\244\303\244\302", "ddi"}, {"\244\303\244\302\244\343", "ddya"},
    {"\244\303\244\302\244\345", "ddyu"}, {"\244\303\244\302\244\347", "ddyo"},
    {"\244\303\244\304", "ttu"}, {"\244\303\244\305", "ddu"},
    {"\244\303\244\306", "tte"}, {"\244\303\244\307", "dde"},
    {"\244\303\244\310", "tto"}, {"\244\303\244\311", "ddo"},
    {"\244\303\244\317", "hha"}, {"\244\303\244\320", "bba"},
    {"\244\303\244\321", "ppa"},
    {"\244\303\244\322", "hhi"}, {"\244\303\244\322\244\343", "hhya"},
    {"\244\303\244\322\244\345", "hhyu"}, {"\244\303\244\322\244\347", "hhyo"},
    {"\244\303\244\323", "bbi"}, {"\244\303\244\323\244\343", "bbya"},
    {"\244\303\244\323\244\345", "bbyu"}, {"\244\303\244\323\244\347", "bbyo"},
    {"\244\303\244\324", "ppi"}, {"\244\303\244\324\244\343", "ppya"},
    {"\244\303\244\324\244\345", "ppyu"}, {"\244\303\244\324\244\347", "ppyo"},
    {"\244\303\244\325", "hhu"}, {"\244\303\244\325\244\241", "ffa"},
    {"\244\303\244\325\244\243", "ffi"}, {"\244\303\244\325\244\247", "ffe"},
    {"\244\303\244\325\244\251", "ffo"},
    {"\244\303\244\326", "bbu"}, {"\244\303\244\327", "ppu"},
    {"\244\303\244\330", "hhe"}, {"\244\303\244\331", "bbe"},
    {"\244\303\244\332", "ppe"},
    {"\244\303\244\333", "hho"}, {"\244\303\244\334", "bbo"},
    {"\244\303\244\335", "ppo"},
    {"\244\303\244\344", "yya"}, {"\244\303\244\346", "yyu"},
    {"\244\303\244\350", "yyo"},
    {"\244\303\244\351", "rra"}, {"\244\303\244\352", "rri"},
    {"\244\303\244\352\244\343", "rrya"}, {"\244\303\244\352\244\345", "rryu"},
    {"\244\303\244\352\244\347", "rryo"},
    {"\244\303\244\353", "rru"}, {"\244\303\244\354", "rre"},
    {"\244\303\244\355", "rro"},

    {"\244\304", "tu"}, {"\244\305", "du"},
    {"\244\306", "te"}, {"\244\307", "de"},
    {"\244\310", "to"}, {"\244\311", "do"},

    {"\244\312", "na"},
    {"\244\313", "ni"}, {"\244\313\244\343", "nya"},
    {"\244\313\244\345", "nyu"}, {"\244\313\244\347", "nyo"},
    {"\244\314", "nu"}, {"\244\315", "ne"}, {"\244\316", "no"},

    {"\244\317", "ha"}, {"\244\320", "ba"}, {"\244\321", "pa"},
    {"\244\322", "hi"}, {"\244\322\244\343", "hya"},
    {"\244\322\244\345", "hyu"}, {"\244\322\244\347", "hyo"},
    {"\244\323", "bi"}, {"\244\323\244\343", "bya"},
    {"\244\323\244\345", "byu"}, {"\244\323\244\347", "byo"},
    {"\244\324", "pi"}, {"\244\324\244\343", "pya"},
    {"\244\324\244\345", "pyu"}, {"\244\324\244\347", "pyo"},
    {"\244\325", "hu"}, {"\244\325\244\241", "fa"},
    {"\244\325\244\243", "fi"}, {"\244\325\244\247", "fe"},
    {"\244\325\244\251", "fo"},
    {"\244\326", "bu"}, {"\244\327", "pu"},
    {"\244\330", "he"}, {"\244\331", "be"}, {"\244\332", "pe"},
    {"\244\333", "ho"}, {"\244\334", "bo"}, {"\244\335", "po"},

    {"\244\336", "ma"},
    {"\244\337", "mi"}, {"\244\337\244\343", "mya"},
    {"\244\337\244\345", "myu"}, {"\244\337\244\347", "myo"},
    {"\244\340", "mu"}, {"\244\341", "me"}, {"\244\342", "mo"},

    {"\244\343", "ya"}, {"\244\344", "ya"},
    {"\244\345", "yu"}, {"\244\346", "yu"},
    {"\244\347", "yo"}, {"\244\350", "yo"},

    {"\244\351", "ra"},
    {"\244\352", "ri"}, {"\244\352\244\343", "rya"},
    {"\244\352\244\345", "ryu"}, {"\244\352\244\347", "ryo"},
    {"\244\353", "ru"}, {"\244\354", "re"}, {"\244\355", "ro"},

    {"\244\356", "wa"}, {"\244\357", "wa"},
    {"\244\360", "i"}, {"\244\361", "e"}, 
    {"\244\362", "wo"}, {"\244\363", "n"},

    {"\244\363\244\242", "n'a"}, {"\244\363\244\244", "n'i"},
    {"\244\363\244\246", "n'u"}, {"\244\363\244\250", "n'e"},
    {"\244\363\244\252", "n'o"},

    {"", ""},
};

#define H2rom_buflen 11

int
H2rom(c, n, type)
     Character *c;
     Character *n;
     int type;
{
    static int index_table[0x81];
    static int index_made = UNINITIALIZED;
    static struct H2rom_tbl *H2rom_ptr;
    struct H2rom_tbl *p;
    int i, clen, ylen;
    unsigned char buffer[H2rom_buflen];
    int max_match, match_more;
    char *max_romaji;

    if (index_made != romaji_type) {
	int last;

	for (i = 0; i < 0x81; ++ i) {
	    index_table[i] = -1;
	}
	index_table[0x21] = 0;
	H2rom_ptr = (romaji_type == HEPBURN) ? H2rom_h_table : H2rom_k_table;
	if (use_old_romaji_table && romaji_type == HEPBURN)
	    H2rom_ptr = H2rom_h_table_old;
	if (use_old_romaji_table && romaji_type == KUNREI)
	    H2rom_ptr = H2rom_k_table_old;
	for (p = H2rom_ptr, i = 0; *(p->kana) != '\0'; ++ p, ++ i) {
	    index_table[(((p->kana)[1])&0x7f)+1] = i+1;
	}
	last = i;
	for (i = 0x80; i >= 0; -- i) {
	    if (index_table[i] == -1)
		index_table[i] = last;
	    else
		last = index_table[i];
	}
	index_made = romaji_type;
    }

    buffer[H2rom_buflen-1] = '\0'; clen = H2rom_buflen-1;
    for (i = 0; i < (H2rom_buflen-1)/2; i ++) {
	buffer[i*2  ] = c[i].c1;
	buffer[i*2+1] = c[i].c2;

	if (c[i].c1 == '\0') {
	    clen = i*2;
	    break;
	}
    }

    if (clen == 0) {
	n[0].type=OTHER;
	n[0].c1 = '\0';
	return 0;
    }

    max_match = 0;
    max_romaji = NULL;
    match_more = 0;
    for (i = index_table[buffer[1]&0x7f];
	 i < index_table[(buffer[1]&0x7f)+1];
	 ++ i) {
	ylen = strlen((const char *)(H2rom_ptr[i].kana));
	if (clen >= ylen) {
	    if (max_match < ylen) {
		if (strncmp((const char *)buffer, (char *)(H2rom_ptr[i].kana), ylen) == 0) {
		    max_match = ylen/2;
		    max_romaji = H2rom_ptr[i].romaji;
		}
	    }
	} else {
	    if (match_more == 0)
		if (strncmp((const char *)buffer, (char *)(H2rom_ptr[i].kana), clen) == 0)
		    match_more = 1;
	}
    }

    if (max_romaji == NULL) {
	i = 0;
	max_match = 1;
    } else {
	for (i = 0; max_romaji[i] != '\0'; ++ i) {
	    n[i].type=type;
	    n[i].c1 = max_romaji[i];
	}
    }
    n[i].type=OTHER;
    n[i].c1 = '\0';

    return (match_more == 0) ? max_match : -max_match;
}

int
H2a(c, n)
     Character *c;
     Character *n;
{
    return H2rom(c, n, ASCII);
}

int
H2j(c, n)
     Character *c;
     Character *n;
{
    return H2rom(c, n, JISROMAN);
}

int
H2K(c, n)
     Character *c;
     Character *n;
{
    if (c[0].c1 == 0xa4) {
	n[0].type = JIS83;
	n[0].c1 = 0xa5;
	n[0].c2 = c[0].c2;
	n[1].type = OTHER;
	n[1].c1 = 0;
	n[1].c2 = 0;
	if (c[0].c2 == 0xa6) { /* == charcter code(\244\246) */
	    if (c[1].c1 == 0)
		return -1;
	    if ((c[1].c1 == 0xa1) && (c[1].c2 == 0xab)) { /* == charcter code(\244\246),charcter code(\241\253) */
		n[0].type = JIS83;
		n[0].c1 = 0xa5;
		n[0].c2 = 0xf4;
		return 2;
	    }
	}
	return 1;
    } else if (c[0].c1 == 0xa1) {
	if ((c[0].c2 == 0xbc) || (c[0].c2 == 0xab) || (c[0].c2 == 0xac)) {
	    n[0].type = JIS83;
	    n[0].c1 = c[0].c1;
	    n[0].c2 = c[0].c2;
	    n[1].type = OTHER;
	    n[1].c1 = 0;
	    n[1].c2 = 0;
	    return 1;
	} else if (c[0].c2 == 0xb5 || c[0].c2 == 0xb6) {
	    n[0].type = JIS83;
	    n[0].c1 = c[0].c1;
	    n[0].c2 = c[0].c2 - 2;
	    n[1].type = OTHER;
	    n[1].c1 = 0;
	    n[1].c2 = 0;
	    return 1;
	}
    }
    n[0].type = OTHER;
    n[0].c1 = 0;
    n[0].c2 = 0;
    return 1;
}

int
H2k(c, n)
     Character *c;
     Character *n;
{
    unsigned char *b;
    int i;

    static unsigned char H2k_table[0x60][3] = {
	"",   "'",  "1",  "(",  "2",  ")",  "3",  "*",
	"4",  "+",  "5",  "6",  "6^", "7",  "7^", "8",
	"8^", "9",  "9^", ":",  ":^", ";",  ";^", "<",
	"<^", "=",  "=^", ">",  ">^", "?",  "?^", "@",
	"@^", "A",  "A^", "/",  "B",  "B^", "C",  "C^",
	"D",  "D^", "E",  "F",  "G",  "H",  "I",  "J",
	"J^", "J_", "K",  "K^", "K_", "L",  "L^", "L_",
	"M",  "M^", "M_", "N",  "N^", "N_", "O",  "P",
	"Q",  "R",  "S",  ",",  "T",  "-",  "U",  ".",
	"V",  "W",  "X",  "Y",  "Z",  "[",  "\\",  "\\",
	"2",  "4",  "&",  "]",  "",   "",   "",   "",
	"",   "",   "",   "",   "",   "",   "",   ""};

    if (c[0].c1 == 0xa4) {
	for (b = H2k_table[(c[0].c2 & 0x7f) - 0x20], i = 0;
	     *b != '\0'; ++ b, ++ i) {
	    n[i].type = KATAKANA;
	    n[i].c1 = *b;
	}
	n[i].type = OTHER;
	n[i].c1 = 0;
    } else if ((c[0].c1 == 0xa1) &&
	       ((c[0].c2 == 0xbc) || (c[0].c2 == 0xab) || (c[0].c2 == 0xac))) {
	n[0].type = KATAKANA;
	switch(c[0].c2) {
	  case 0xbc:
	    n[0].c1 = '0'; break;
	  case 0xab:
	    n[0].c1 = '^'; break;
	  case 0xac:
	    n[0].c1 = '_'; break;
	}
	n[1].type = OTHER;
	n[1].c1 = 0;
    } else {
	n[0].type = OTHER;
	n[0].c1 = 0;
    }
    return 1;
}

#ifdef WAKATIGAKI
/* As for the hiragana as well, the function which isn't necessarily needed if reading raising becomes possible. */
int
H2H(c, n)
     Character *c;
     Character *n;
{
    /* Hiragana except for '\244\362' */
    if ((c[0].c1 == 0xA4 && c[0].c2 != 0xF2) ||
	(c[0].c1 == 0xA1 &&
	 (c[0].c2 == 0xBC || c[0].c2 == 0xAB || c[0].c2 == 0xAC))) {
        if (bunkatu_mode) {
	    if (! terminate_done) {
		if (separator_out != 1 || wo_mode == 1)
		    separator_out = 2;
	    } else {
		separator_out = 1;
	    }
        }
	wo_mode = 0;
	n[0].type = JIS83;
	n[0].c1 = c[0].c1;
	n[0].c2 = c[0].c2;
	n[1].type = OTHER;
	n[1].c1 = 0;
	n[1].c2 = 0;
	return 2;
    } else if (c[0].c1 == 0xA4 && c[0].c2 == 0xF2) { /* '\244\362' */
	wo_mode = 1;
	if (bunkatu_mode) {
	    if (! terminate_done)
		separator_out = 2;
	}
	n[0].type = JIS83;
	n[0].c1 = c[0].c1;
	n[0].c2 = c[0].c2;
	n[1].type = OTHER;
	n[1].c1 = 0;
	n[1].c2 = 0;
	return 2;
    } else {
	wo_mode = 0;
	separator_out = 0;
	n[0].type = OTHER;
	n[0].c1 = 0;
	n[0].c2 = 0;
	return 1;
    }
}
#endif /* WAKATIGAKI */
