using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using vi2.Model;

namespace vi2.View
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    /// 

    public partial class MainWindow : Window
    {
        private Visibility _editButtonVisibility = Visibility.Visible;
        private Visibility _deletButtonVisibility = Visibility.Visible;
        public Visibility AddDishButtonVisibility { get; set; } = Visibility.Visible;
        public Visibility AddDrinkButtonVisibility { get; set; } = Visibility.Visible;
        public Visibility KitchenButtonVisibility { get; set; } = Visibility.Visible;
        public Visibility BarButtonVisibility { get; set; } = Visibility.Visible;

        public int UserRole { get; set; } // Свойство для хранения роли пользователя

        private KitchenWindow _addKitchen;
        private BarWindow _addBar;

        private CategoryDish _selectedDishCategory;
        private CategoryDrink _selectedDrinkCategory;

        public ObservableCollection<CategoryDish> DishCategories { get; set; }
        public ObservableCollection<CategoryDrink> DrinkCategories { get; set; }

        private Visibility _detailsButtonVisibility;
        public Visibility DetailsButtonVisibility
        {
            get => _detailsButtonVisibility;
            set
            {
                if (_detailsButtonVisibility != value)
                {
                    _detailsButtonVisibility = value;
                    OnPropertyChanged(nameof(DetailsButtonVisibility));
                }
            }
        }

        public Visibility EditButtonVisibility
        {
            get { return _editButtonVisibility; }
            set
            {
                _editButtonVisibility = value;
                OnPropertyChanged(nameof(EditButtonVisibility));
            }
        }

        public Visibility DeletButtonVisibility
        {
            get { return _deletButtonVisibility; }
            set
            {
                _deletButtonVisibility = value;
                OnPropertyChanged(nameof(EditButtonVisibility));
            }
        }

        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public MainWindow()
        {
            InitializeComponent();
            LoadCategories();
            this.Loaded += MainWindow_Loaded;
            DataContext = this;


        }

        private void LoadCategories()
        {
            DishCategories = new ObservableCollection<CategoryDish>(RestaurantBDEntities1.GetContext().CategoryDish.ToList());
            DrinkCategories = new ObservableCollection<CategoryDrink>(RestaurantBDEntities1.GetContext().CategoryDrink.ToList());
            MainCategoryComboBox.SelectedIndex = 0;
        }

        private void MainWindow_Loaded(object sender, RoutedEventArgs e)
        {
            // Вызываем событие выбора основной категории, чтобы заполнить подкатегории и элементы
            MainCategoryComboBox_SelectionChanged(MainCategoryComboBox, null);
            // Если подкатегории уже загружены в ComboBox, выбираем первый элемент
            if (SubCategoryComboBox.HasItems)
            {
                SubCategoryComboBox.SelectedIndex = 0;
            }
        }

        private void MainCategoryComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            

           
            SubCategoryComboBox.ItemsSource = null; // Очищаем источник данных для подкатегорий
            ItemsControl.ItemsSource = null; // Очищаем отображаемые элементы

            if (MainCategoryComboBox.SelectedItem is ComboBoxItem selectedItem)
            {
                var selectedCategoryType = selectedItem.Content.ToString();
                if (selectedCategoryType == "Блюда")
                {
                    SubCategoryComboBox.ItemsSource = DishCategories;
                    SubCategoryComboBox.DisplayMemberPath = "Name";
                    DetailsButtonVisibility = Visibility.Visible;

                }
                else if (selectedCategoryType == "Напитки")
                {
                    SubCategoryComboBox.ItemsSource = DrinkCategories;
                    SubCategoryComboBox.DisplayMemberPath = "Name";
                    DetailsButtonVisibility = Visibility.Collapsed;
                    

                }
                if (SubCategoryComboBox.Items.Count > 0)
                {
                    SubCategoryComboBox.SelectedIndex = 0;
                }
                if (UserRole == 4)
                {
                    AddDrink.Visibility = Visibility.Collapsed;
                    AddDish.Visibility = Visibility.Collapsed;
                    // Также убедитесь, что скрываете другие кнопки, если они есть
                }
                else
                {
                   
                    if (selectedCategoryType == "Блюда")
                    {
                        SubCategoryComboBox.ItemsSource = DishCategories;
                        SubCategoryComboBox.DisplayMemberPath = "Name";
                        DetailsButtonVisibility = Visibility.Visible;

                    }
                    else if (selectedCategoryType == "Напитки")
                    {
                        SubCategoryComboBox.ItemsSource = DrinkCategories;
                        SubCategoryComboBox.DisplayMemberPath = "Name";
                        DetailsButtonVisibility = Visibility.Collapsed;

                    }
                    if (SubCategoryComboBox.Items.Count > 0)
                    {
                        SubCategoryComboBox.SelectedIndex = 0;
                    }
                }
                
               
            }
        
        }

        private void UpdateDishAndDrinkList(object sender, SelectionChangedEventArgs e)
        {
            // Проверяем, выбрана ли подкатегория блюд
            if (SubCategoryComboBox.SelectedItem is CategoryDish selectedDishCategory)
            {
                // Загрузка блюд для выбранной подкатегории
                var dishes = RestaurantBDEntities1.GetContext().DishAndDrink
                    .Where(dd => dd.IdCategoryDish == selectedDishCategory.Id)
                    .ToList();
                ItemsControl.ItemsSource = dishes;
            }
            // Проверяем, выбрана ли подкатегория напитков
            else if (SubCategoryComboBox.SelectedItem is CategoryDrink selectedDrinkCategory)
            {
                // Загрузка напитков для выбранной подкатегории
                var drinks = RestaurantBDEntities1.GetContext().DishAndDrink
                    .Where(dd => dd.IdCategoryDrink == selectedDrinkCategory.Id)
                    .ToList();
                ItemsControl.ItemsSource = drinks;
            }
            if (ItemsControl.Items.Count > 0)
            {

            }
            if (MainCategoryComboBox.SelectedItem is ComboBoxItem selectedItem)
            {
                var selectedCategoryType = selectedItem.Content.ToString();
                DetailsButtonVisibility = selectedCategoryType == "Блюда" ? Visibility.Visible : Visibility.Collapsed;
            }
                
        }

        

        private void SubCategoryComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (SubCategoryComboBox.SelectedItem is CategoryDish selectedDishCategory)
            {
                _selectedDishCategory = selectedDishCategory;
                _selectedDrinkCategory = null;
            }
            else if (SubCategoryComboBox.SelectedItem is CategoryDrink selectedDrinkCategory)
            {
                _selectedDishCategory = null;
                _selectedDrinkCategory = selectedDrinkCategory;
            }

            UpdateDishAndDrinkList(sender, e);
        }

        private void Description_Click(object sender, RoutedEventArgs e)
        {
            Button detailsButton = sender as Button;
            DishAndDrink selectedItem = detailsButton.DataContext as DishAndDrink;

            if (selectedItem != null)
            {
                DetailsWindow detailsWindow = new DetailsWindow
                {
                    DataContext = selectedItem // Устанавливаем DataContext для окна подробностей
                };
                detailsWindow.ShowDialog(); // Показываем окно как диалоговое
            }

        }

        

        private void Exit(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void bar(object sender, RoutedEventArgs e)
        {
            if (_addBar == null || !_addBar.IsVisible)
            {
                _addBar = new BarWindow();
                _addBar.Show();
            }
        }

        private void kitchen(object sender, RoutedEventArgs e)
        {
            if (_addKitchen == null || !_addKitchen.IsVisible)
            {
                _addKitchen = new KitchenWindow();
                _addKitchen.Show();
            }
           
        }

        

        private void OrderButton(object sender, RoutedEventArgs e)
        {
            Button orderButton = sender as Button;
            DishAndDrink selectedItem = orderButton.DataContext as DishAndDrink;

            if (selectedItem != null)
            {
                OrderWindow orderWindow = new OrderWindow(selectedItem.Name, selectedItem.Id);
                orderWindow.ShowDialog(); // Показываем окно заказа как диалоговое
            }
        }

       

        private void EditButton_Click(object sender, RoutedEventArgs e)
        {
            if (MainCategoryComboBox.SelectedItem is ComboBoxItem selectedItem)
            {
                var selectedCategoryType = selectedItem.Content.ToString();
                if (selectedCategoryType == "Блюда")
                {
                    EditAddWindowDrink editAddWindowDish = new EditAddWindowDrink((sender as Button).DataContext as DishAndDrink);
                    editAddWindowDish.ShowDialog(); // Показываем окно как диалоговое для добавления
                    RefreshItemsControl();
                    // Обновляем список элементов

                }
                else if (selectedCategoryType == "Напитки")
                {
                    AddDrinkEdit editAddWindowDrink = new AddDrinkEdit((sender as Button).DataContext as DishAndDrink);
                    editAddWindowDrink.ShowDialog(); // Показываем окно как диалоговое для добавления
                    RefreshItemsControl();

                }
                if (SubCategoryComboBox.Items.Count > 0)
                {
                    SubCategoryComboBox.SelectedIndex = 0;
                }
            }
        }
        // Метод для обновления списка элементов в ItemsControl после добавления/редактирования
        private void RefreshItemsControl()
        {
            if (SubCategoryComboBox.SelectedItem is CategoryDish selectedDishCategory)
            {
                // Загрузка блюд для выбранной подкатегории
                var dishes = RestaurantBDEntities1.GetContext().DishAndDrink
                    .Where(dd => dd.IdCategoryDish == selectedDishCategory.Id)
                    .ToList();
                ItemsControl.ItemsSource = dishes;
            }
            // Проверяем, выбрана ли подкатегория напитков
            else if (SubCategoryComboBox.SelectedItem is CategoryDrink selectedDrinkCategory)
            {
                // Загрузка напитков для выбранной подкатегории
                var drinks = RestaurantBDEntities1.GetContext().DishAndDrink
                    .Where(dd => dd.IdCategoryDrink == selectedDrinkCategory.Id)
                    .ToList();
                ItemsControl.ItemsSource = drinks;
            }
            if (ItemsControl.Items.Count > 0)
            {

            }
            if (MainCategoryComboBox.SelectedItem is ComboBoxItem selectedItem)
            {
                var selectedCategoryType = selectedItem.Content.ToString();
                DetailsButtonVisibility = selectedCategoryType == "Блюда" ? Visibility.Visible : Visibility.Collapsed;
            }
        }

        

 

        

        private void AddDrink_Click(object sender, RoutedEventArgs e)
        {

            var addDrinkhWindow = new AddDrinkEdit();
            addDrinkhWindow.ShowDialog();

            // Обновление интерфейса после закрытия окна добавления/редактирования
            RefreshItemsControl();
        }

        private void AddDish_Click(object sender, RoutedEventArgs e)
        {
            var addDishWindow = new EditAddWindowDrink();
            addDishWindow.ShowDialog();

            // Обновление интерфейса после закрытия окна добавления/редактирования
            RefreshItemsControl();
        }

        private void DeletButton_Click(object sender, RoutedEventArgs e)
        {
            // Получение кнопки, которая была нажата
            Button deleteButton = sender as Button;
            if (deleteButton != null)
            {
                // Получение привязанного элемента (в данном случае DishAndDrink)
                DishAndDrink dishAndDrinkToDelete = deleteButton.DataContext as DishAndDrink;
                if (dishAndDrinkToDelete != null)
                {
                    // Запрос подтверждения у пользователя
                    MessageBoxResult confirmationResult = MessageBox.Show(
                        "Вы уверены, что хотите удалить этот элемент?",
                        "Подтверждение удаления",
                        MessageBoxButton.YesNo,
                        MessageBoxImage.Question);

                    if (confirmationResult == MessageBoxResult.Yes)
                    {
                        // Если пользователь подтвердил удаление, удаляем элемент
                        RestaurantBDEntities1.GetContext().DishAndDrink.Remove(dishAndDrinkToDelete);
                        RestaurantBDEntities1.GetContext().SaveChanges();

                        // Обновляем ItemsControl
                        RefreshItemsControl();
                    }
                }
            }
        }
    }
}
