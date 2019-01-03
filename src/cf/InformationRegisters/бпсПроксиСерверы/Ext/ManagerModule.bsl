﻿
Функция ПолучитьМассивНастроекПроксиСерверов() Экспорт
	
	МассивНастроекПроксиСерверов = Новый Массив;
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ ПЕРВЫЕ 5
		|	бпсПроксиСерверы.Адрес,
		|	бпсПроксиСерверы.Порт,
		|	бпсПроксиСерверы.Логин,
		|	бпсПроксиСерверы.Пароль,
		|	бпсПроксиСерверы.ОценкаРаботоспособности КАК ОценкаРаботоспособности
		|ИЗ
		|	РегистрСведений.бпсПроксиСерверы КАК бпсПроксиСерверы
		|
		|УПОРЯДОЧИТЬ ПО
		|	ОценкаРаботоспособности УБЫВ";
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Выборка = РезультатЗапроса.Выбрать();
	
	Пока Выборка.Следующий() Цикл
		НастройкиПроксиСтруктура = Новый Структура;
		НастройкиПроксиСтруктура.Вставить("Адрес");
		НастройкиПроксиСтруктура.Вставить("Порт");
		НастройкиПроксиСтруктура.Вставить("Логин");
		НастройкиПроксиСтруктура.Вставить("Пароль");
		ЗаполнитьЗначенияСвойств(НастройкиПроксиСтруктура, Выборка);
		МассивНастроекПроксиСерверов.Добавить(НастройкиПроксиСтруктура);
	КонецЦикла;
	
	Возврат МассивНастроекПроксиСерверов;
	
КонецФункции

Процедура ИзменитьОценкуРаботоспособностиПроксиСервера(АдресПрокси, ПортПрокси, ИзменениеОценки = 0) Экспорт

	Запись = РегистрыСведений.бпсПроксиСерверы.СоздатьМенеджерЗаписи();
    Запись.Адрес = АдресПрокси;
	Запись.Порт = ПортПрокси;
	Запись.Прочитать();
	Если Не Запись.Выбран() Тогда
		Возврат;
	КонецЕсли;	
	
	Запись.ОценкаРаботоспособности = Запись.ОценкаРаботоспособности + ИзменениеОценки;
	Запись.Записать();

КонецПроцедуры
