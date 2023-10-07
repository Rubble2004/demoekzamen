1. Вывод базы из данных может быть в виде таблицы или плиткой (Часто одна страница под каждый вывод)
За таблицу отвечает grid,за плитку ListView

<br>Алгоритм</br>
Для получения данных нужно создать контекст

<br>Строчки кода </br>


    public static RulikEntities contextRu;
        public static RulikEntities GetContext()
        {
            if (contextRu == null)
                contextRu = new RulikEntities();
            
            return contextRu;

        }




   <br>Вторая строчка нужна будет для кнопок добавить и удалить.</br>
   
        <Grid.RowDefinitions>
            <RowDefinition Height="50"></RowDefinition>
        </Grid.RowDefinitions>
