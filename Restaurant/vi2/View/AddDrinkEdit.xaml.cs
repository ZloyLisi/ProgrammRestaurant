using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using vi2.Model;

namespace vi2.View
{
    /// <summary>
    /// Логика взаимодействия для AddDrinkEdit.xaml
    /// </summary>
    public partial class AddDrinkEdit : Window
    {
        private readonly bool _isEditDrink;
        private readonly DishAndDrink _dishAndDrink;
        private readonly RestaurantBDEntities1 _contextDrink = RestaurantBDEntities1.GetContext();
        public AddDrinkEdit(DishAndDrink dishAndDrink = null)
        {
            InitializeComponent();
            _dishAndDrink = dishAndDrink ?? new DishAndDrink();
            _isEditDrink = dishAndDrink != null;

            // Заполнение ComboBox категориями блюд
            CategoryDrinkComboBox.ItemsSource = _contextDrink.CategoryDrink.ToList();
            CategoryDrinkComboBox.SelectedValuePath = "Id";
            CategoryDrinkComboBox.DisplayMemberPath = "Name";
            

            if (_isEditDrink)
            {
                // Инициализация полей для редактирования
                NameTextBoxDrink.Text = _dishAndDrink.Name;
                PriceTextBoxDrink.Text = _dishAndDrink.Price.ToString(CultureInfo.InvariantCulture);
                CategoryDrinkComboBox.SelectedValue = _dishAndDrink.IdCategoryDrink;
                if (!string.IsNullOrEmpty(_dishAndDrink.Foto))
                {
                    PhotoImageDrink.Source = new BitmapImage(new Uri(_dishAndDrink.Foto, UriKind.Absolute));
                }
            }
            else
            {
                // Установка значения по умолчанию для новых напитков
                _dishAndDrink.IdCategoryDishAndDrink = 1;
            }
        }

        private void UploadFoto_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog
            {
                Filter = "Image files (*.png;*.jpeg;*.jpg)|*.png;*.jpeg;*.jpg|All files (*.*)|*.*"
            };
            if (openFileDialog.ShowDialog() == true)
            {
                _dishAndDrink.Foto = openFileDialog.FileName;
                PhotoImageDrink.Source = new BitmapImage(new Uri(_dishAndDrink.Foto));
            }
            else
            {
                // Если файл не выбран, показываем сообщение
                MessageBox.Show("Изображение не выбрано.");
            }
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            // Валидация данных
            if (string.IsNullOrWhiteSpace(NameTextBoxDrink.Text) ||
                string.IsNullOrWhiteSpace(PriceTextBoxDrink.Text) ||
                CategoryDrinkComboBox.SelectedItem == null)
            {
                MessageBox.Show("Пожалуйста, заполните все поля.");
                return;
            }

            if (!decimal.TryParse(PriceTextBoxDrink.Text, NumberStyles.Any, CultureInfo.CurrentCulture, out decimal price))
            {
                MessageBox.Show("Цена должна быть числом.");
                return;
            }

            // Сохранение данных
            _dishAndDrink.Name = NameTextBoxDrink.Text;
            _dishAndDrink.Price = price;
            _dishAndDrink.IdCategoryDrink = (int)CategoryDrinkComboBox.SelectedValue;

            if (!_isEditDrink)
            {
                _contextDrink.DishAndDrink.Add(_dishAndDrink);
            }
            else
            {
                _contextDrink.Entry(_dishAndDrink).State = EntityState.Modified;
            }

            try
            {
                _contextDrink.SaveChanges();
                Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка сохранения: {ex.Message}");
            }
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void PriceTextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            // Разрешаем ввод только чисел, точки и запятой
            e.Handled = !Regex.IsMatch(e.Text, @"[0-9.,]");
        }

        private void PriceTextBox_Pasting(object sender, DataObjectPastingEventArgs e)
        {
            if (e.DataObject.GetDataPresent(typeof(string)))
            {
                var text = (string)e.DataObject.GetData(typeof(string));
                if (!Regex.IsMatch(text, @"^[0-9.,]+$"))
                {
                    e.CancelCommand();
                }
            }
            else
            {
                e.CancelCommand();
            }
        }
    }
}
