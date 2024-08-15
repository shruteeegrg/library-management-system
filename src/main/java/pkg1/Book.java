package pkg1;

import java.util.Date;

public class Book {
    private int bookID;
    private String isbn; 
    private String title;
    private String author;
    private String publisher;
    private Date publicationDate;
    private String category;
    private String language;
    private int pages;
    private int copiesAvailable; 
    private String shelfLocation;

    @Override
    public String toString() {
        return "Book [bookID=" + bookID + ", isbn=" + isbn + ", title=" + title + ", author=" + author + ", publisher="
                + publisher + ", publicationDate=" + publicationDate + ", category=" + category + ", language="
                + language + ", pages=" + pages + ", copiesAvailable=" + copiesAvailable + ", shelfLocation="
                + shelfLocation + "]";
    }

    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public Date getPublicationDate() {
        return publicationDate;
    }

    public void setPublicationDate(Date publicationDate) {
        this.publicationDate = publicationDate;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public int getPages() {
        return pages;
    }

    public void setPages(int pages) {
        this.pages = pages;
    }

    public int getCopiesAvailable() {
        return copiesAvailable;
    }

    public void setCopiesAvailable(int copiesAvailable) {
        this.copiesAvailable = copiesAvailable;
    }

    public String getShelfLocation() {
        return shelfLocation;
    }

    public void setShelfLocation(String shelfLocation) {
        this.shelfLocation = shelfLocation;
    }

    public Book(int bookID, String isbn, String title, String author, String publisher, Date publicationDate,
                String category, String language, int pages, int copiesAvailable, String shelfLocation) {
        this.bookID = bookID;
        this.isbn = isbn;
        this.title = title;
        this.author = author;
        this.publisher = publisher;
        this.publicationDate = publicationDate;
        this.category = category;
        this.language = language;
        this.pages = pages;
        this.copiesAvailable = copiesAvailable;
        this.shelfLocation = shelfLocation;
    }
    public Book() {
    this.bookID = 0;
    this.isbn = "";
    this.title = "";
    this.author = "";
    this.publisher = "";
    this.publicationDate = null;
    this.category = "";
    this.language = "";
    this.pages = 0;
    this.copiesAvailable = 0;
    this.shelfLocation = "";
}
    
}
