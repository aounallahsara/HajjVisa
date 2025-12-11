class Translator {
  static String translate(String text, String language) {
    if (language == 'en') {
      // Liste simplifiée des traductions
      switch (text) {
        case 'سفارة المملكة العربية السعودية القسم القنصلي':
          return 'Embassy of Saudi Arabia - Consular Section';
        case 'الغاية من السفر':
          return 'Purpose of Travel';
        case 'للإقامة':
          return 'residence';
        case 'الحقل فارغ':
          return 'The feild is Empty!';

        case 'اسم المحرم':
          return "Mahram's name";
        case "الجدول":
          return "Table";
        case 'صلته':
          return " relationship";
        case 'تواصل معنا':
          return 'Contact Us';
        case 'ابدأ الطلب':
          return 'Start Application';
        case 'مرحبًا بكم في بوابة تأشيرات السعودية - منصتكم الموثوقة لتجربة تقديم تأشيرات سهلة وفعالة':
          return "Welcome to the Saudi Arabia Visa Portal – Your trusted platform for a smooth and efficient visa application experience.";
        case 'المعلومات الشخصية':
          return 'Personal Information';
        case 'حول السفر':
          return 'About Travelling';
        case 'المستندات':
          return 'Documents';
        case 'المراجعة':
          return 'Review';
        case 'الدفع':
          return 'Payment';
        case 'الإسم الكامل':
          return 'Full Name';
        case 'اسم الأم':
          return "Mother's Name";
        case 'مكان الولادة':
          return 'Place of Birth';
        case 'تاريخ الميلاد':
          return 'Date of Birth';
        case 'الجنسية الحالية':
          return 'Current Nationality';
        case 'الجنسية السابقة':
          return 'Previous Nationality';
        case 'الجنس':
          return 'Gender';
        case 'الحالة الاجتماعية':
          return 'Marital Status';
        case 'ذكر':
          return 'Male';
        case "إضافة معال":
          return "Add a Member";
        case "إيضاحات تخص أفراد العائلة (المعالين) على نفس جواز السفر:":
          return "Clarifications regarding family members (dependents) on the same passport.";
        case 'أنثى':
          return 'Female';
        case 'الصلة':
          return 'relationship';
        case 'أعزب':
          return 'Single';
        case 'متزوج':
          return 'Married';
        case 'رقم الجواز':
          return 'Passport Number';
        case 'تاريخ الإصدار':
          return 'Issue Date';
        case 'محل الإصدار':
          return 'Place of Issue';
        case 'تاريخ انتهاء صلاحية الجواز':
          return 'Passport Expiry Date';
        case 'تاريخ المغادرة':
          return 'Departure Date';
        case 'تاريخ الوصول':
          return 'Arrival Date';
        case 'مدة الإقامة بالمملكة':
          return 'Stay Duration';
        case 'طريقة الدفع':
          return 'Payment Method';
        case 'الرقم':
          return 'Number';
        case 'ارمل':
          return 'Widowed';
        case 'التأكيد':
          return 'Confirmation';
        case 'تم حفظ معلوماتك بنجاح!':
          return 'Your information has been saved successfully!';
        case 'الطلب قيد المعالجة.':
          return 'Request is in progress.';
        case 'العودة إلى الصفحة الرئيسية':
          return 'Return to Home Page';
        case 'إيصال':
          return 'Receipt';
        case 'شيك':
          return 'cheque';
        case 'مجاملة':
          return 'Courtesy';
        case 'نقدا':
          return 'Cash';
        case 'مطلق':
          return 'Divorced';
        case 'الديانة':
          return 'Religion';
        case 'المذهب':
          return 'Sect';
        case 'المهنة':
          return 'Job';
        case 'المؤهل العلمي':
          return 'qualification';
        case 'المؤهلات':
          return 'Qualification';
        case 'مصدره':
          return 'Source';
        case 'عنوان المنزل':
          return 'Home Address';
        case 'رقم الهاتف':
          return 'Phone Number';
        case 'عنوان الشركة':
          return 'Company Address';
        case 'عمل':
          return 'Work';
        case 'مرور':
          return 'Transit';
        case 'زيارة':
          return 'Visit';
        case 'عمرة':
          return 'Umrah';
        case 'اقامة':
          return 'Residency';
        case 'حج':
          return 'Hajj';
        case 'دبلوماسية':
          return 'Diplomatic';
        case 'سفارة المملكة العربية السعودية':
          return 'Saudi Arabian Embassy';
        case 'القسم القنصلي':
          return 'Consular Section';
        case 'التالي':
          return 'Next';
        case 'السابق':
          return 'Previous';
        case 'اسم الشركة الناقلة ':
          return "Carrier's name";
        case 'الاسم':
          return 'Name';
        case ' التاريخ':
          return 'Date';
        case 'رقم الشيك':
          return ' cheque No';
        case ' تاريخ الشيك  ':
          return ' cheque Date';
        case ' تاريخ إيصال  ':
          return ' Receipt Date';
        case 'رقم إيصال':
          return ' Receipt No';
        case 'الإسلام':
          return 'Islam';
        case 'المسيحية':
          return 'christianity';
        case 'التوقيع':
          return 'Signature';
        case 'اليهودية':
          return 'Judaism';
        case 'للاستعمال الرسمي فقط:':
          return 'For Official Use Only:';
        case 'رقم الأمر المعتمد عليه او التأشيرة':
          return 'Reference Number or Visa Number';
        case 'لزيارة - العمل لدى':
          return 'For Visit - Work at';
        case 'رقم التأشيرة':
          return 'Visa Number';
        case 'جهة الوصول بالمملكة':
          return 'destination';
        case 'نوعها':
          return 'Type';
        case 'مدتها':
          return 'Duration';
        case 'المبلغ المحصل':
          return 'Amount Collected';
        case 'أنا الموقع أدناه اقر بأن كل المعلومات التي ذكرتها صحيحة وسأكون ملتزماً بقوانين المملكة أثناء فترة إقامتي بها':
          return 'I, the undersigned, acknowledge that all the information provided is correct and that I will comply with the laws of the Kingdom during my stay.';
        case 'نوع الصلة':
          return 'Relationship Type';
        case 'تاريخ الميلاد':
          return 'Date of Birth';
        case 'تاريخ':
          return 'Date';
        case 'الجنس':
          return 'Gender';
        case 'الاسم بالكامل':
          return 'Full Name';
        case 'صورة':
          return 'Picture';
        case 'الإقامة و الدفع':
          return 'Accomodation and payment';
        case 'يرجى اختيار تاريخ الميلاد':
          return 'Choose a Date of birth';

        case " يرجى اختيار تاريخ إيصال ":
          return 'Choose a receipt Date';
        case "يرجى اختيار  تاريخ الشيك ":
          return 'Choose a Cheque Date';
        case "يرجى اختيار تاريخ الوصول ":
          return 'Choose an Arrival Date';
        case "يرجى اختيار تاريخ المغادرة ":
          return 'Choose a Departure Date';
        case 'تاريخ انتهاء صلاحية':
          return "Choose a  Date of passport's expiry";
        case 'يرجى اختيار تاريخ الإصدار ':
          return "Choose a  Date of passport issued";
        case 'يرجى اختيار تاريخ':
          return "Choose a  Date ";
        case "اضغط هنا لتحميل الصورة":
          return "Click here to upload an image";
        case "اضغط هنا لتحميل التوقيع":
          return "Click here to upload a signature";
        default:
          return text; // Return original text if no translation is found
      }
    }
    return text; // Default to original text for non-English translations
  }
}
