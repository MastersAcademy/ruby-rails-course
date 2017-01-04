# Портфолио художника/дизайнера (mvc)
Сайт портфолио, включает в себя галерею работ автора и авторский блог. Но также важно предоставить возможность его клиентам оставлять отзывы о сотрудничестве с ним. Предполагаю резализовать это с авторизацией Facebook.

Авторизация в принципе нужна только для админа, а так, как для отзывов надо будет в любом случае делать авторизацию Facebook, то имеет смысл реализовать авторизовацию админу через FB.

Фронтэнд SPA на Angular2.

По мере формализации требований проекта и общения с "заказчиком" возможно что-то будет добавлено или изменено.

## Class ArtGenerator (creator)
возвращает объект Art, который может быть одиночным изображением, одиночным видео, серией изображений или серией видео, возможно усложнятся текущие или добавлятся дополнительные виды после актуализации требований и тестового использования

> #### ArtImageModel (information expert, polymorphism)
изображение, а так же опциональное текстовое описание работы

> #### ArtVideoModel (information expert, polymorphism)
видео, а так же опциональное текстовое описание работы

> #### ArtImagesModel (information expert, polymorphism)
массив изображений, а так же опциональное текстовое описание работы

> #### ArtVideosModel (information expert, polymorphism)
массив видео, а так же опциональное текстовое описание работы

## Class Portfolio (information expert)
> хранит экземпляры объектов Art

## Class PortfolioController (controller)
> обеспечавает связь между PortfolioView и Portfolio

## Class PortfolioView (indirection)
> обеспечиает REST интерфейс для /portfolio

***

## Class Post (information expert)
> модель поста в блоге

## Class Blog (information expert)
> хранит экземпляры объектов Post

## Class BlogController (controller)
> обеспечавает связь между BlogView и Blog

## Class BlogView (indirection)
> обеспечиает REST интерфейс для /blog

***

## Class Feedback (information expert)
> модель отзыва

## Class Feedbacks (information expert)
> хранит экземпляры объектов FbFeedback

## Class FeedbackController (controller)
> обеспечавает связь между FeedbackView и Feedbacks

## Class FeedbackView (indirection)
> Обеспечиает REST интерфейс для /feedback

***

## Class Db (service, indirection)
> сервисный слой обеспечивающий связь с БД

## Class Facebook (service, indirection)
> обеспечивает работу с api facebook
