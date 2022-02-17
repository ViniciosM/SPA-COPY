class DateUtil {
  static List listDefaultTimes = [
    '07:00',
    '07:30',
    '08:00',
    '08:30',
    '09:00',
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30',
    '20:00',
    '20:30',
    '21:00',
    '21:30',
  ];

  static List listCopyDefaultTimes = [
    '07:00',
    '07:30',
    '08:00',
    '08:30',
    '09:00',
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30',
    '20:00',
    '20:30',
    '21:00',
    '21:30',
  ];

  static DateTime getCurrentDateTime() {
    DateTime dt = DateTime.now();
    print(dt.toLocal());
    return dt.toLocal();
  }

  static int hourNow() {
    DateTime date = DateTime.now();
    print('Hora ${date.hour}');
    return date.hour;
  }

  static DateTime getOneDayAgo() {
    DateTime oneDayAgo;
    DateTime now = DateTime.now();
    oneDayAgo = now.subtract(Duration(days: 1));
    return oneDayAgo;
  }

  static int minuteNow() {
    DateTime date = DateTime.now();
    return date.minute;
  }

  static String timeNow() {
    DateTime date = DateTime.now();
    return '${date.hour}${date.minute}';
  }

  static int getCurrentDay() {
    DateTime date = DateTime.now();
    return date.day;
    //print("O dia da semana é ${date.day}");
  }

  static int getCurrentMonth() {
    DateTime date = DateTime.now();
    return date.month;
    //print("O dia da semana é ${date.month}");
  }

  static int getCurrentYear() {
    DateTime date = DateTime.now();
    int currentDay = date.year;
    //print("O dia da semana é ${date.year}");
    return currentDay;
  }

  static String getCurrentDate() {
    DateTime date = DateTime.now();
    return '${date.day}${date.month}${date.year}';
  }

  static String getFormatCurrentDate() {
    DateTime date = DateTime.now();
    return '${date.day}/${date.month}/${date.year}';
  }

  static String getSelectedDayWeek(int weekday) {
    switch (weekday) {
      case 1:
        return 'Segunda';
      case 2:
        return 'Terça';
      case 3:
        return 'Quarta';
      case 4:
        return 'Quinta';
      case 5:
        return 'Sexta';
      case 6:
        return 'Sábado';
      case 7:
        return 'Domingo';
      default:
        return '';
    }
  }

  static String getNameMonth(int month) {
    switch (month) {
      case 1:
        return 'Janeiro';
      case 2:
        return 'Fevereiro';
      case 3:
        return 'Março';
        break;
      case 4:
        return 'Abril';
        break;
      case 5:
        return 'Maio';
        break;
      case 6:
        return 'Junho';
        break;
      case 7:
        return 'Julho';
        break;
      case 8:
        return 'Agosto';
        break;
      case 9:
        return 'Setembro';
        break;
      case 10:
        return 'Outubro';
        break;
      case 11:
        return 'Novembro';
        break;
      case 12:
        return 'Dezembro';
        break;
      default:
        return '';
    }
  }

  static String getCurrentNameMonth() {
    int month = DateUtil.getCurrentMonth();
    switch (month) {
      case 1:
        return 'Janeiro';
        break;
      case 2:
        return 'Fevereiro';
        break;
      case 3:
        return 'Março';
        break;
      case 4:
        return 'Abril';
        break;
      case 5:
        return 'Maio';
        break;
      case 6:
        return 'Junho';
        break;
      case 7:
        return 'Julho';
        break;
      case 8:
        return 'Agosto';
        break;
      case 9:
        return 'Setembro';
        break;
      case 10:
        return 'Outubro';
        break;
      case 11:
        return 'Novembro';
        break;
      case 12:
        return 'Dezembro';
        break;
      default:
        return '';
    }
  }

  static String getDayOfWeek() {
    DateTime date = DateTime.now();
    //print("O dia da semana é ${date.weekday}");
    switch (date.weekday) {
      case 1:
        return 'Segunda';
        break;
      case 2:
        return 'Terça';
        break;
      case 3:
        return 'Quarta';
        break;
      case 4:
        return 'Quinta';
        break;
      case 5:
        return 'Sexta';
        break;
      case 6:
        return 'Sábado';
        break;
      case 7:
        return 'Domingo';
        break;
      default:
        return '';
    }
  }
}
