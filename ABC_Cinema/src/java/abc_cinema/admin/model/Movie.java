/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package abc_cinema.admin.model;

/**
 *
 * @author Chani
 */
public class Movie {
    private int id;
    private String name;
    private String director;
    private String releasedate;
    private String cast;
    private String description;
    private String poster;
    private String duration;
    private String trailer;
    private String categories;

    public Movie() {
    }

    public Movie(int id, String name, String director, String releasedate, String cast, String description, String poster, String duration, String trailer, String categories) {
        this.id = id;
        this.name = name;
        this.director = director;
        this.releasedate = releasedate;
        this.cast = cast;
        this.description = description;
        this.poster = poster;
        this.duration = duration;
        this.trailer = trailer;
        this.categories = categories;
    }

    public Movie(String name, String director, String releasedate, String cast, String description, String poster, String duration, String trailer, String categories) {
        this.name = name;
        this.director = director;
        this.releasedate = releasedate;
        this.cast = cast;
        this.description = description;
        this.poster = poster;
        this.duration = duration;
        this.trailer = trailer;
        this.categories = categories;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getReleasedate() {
        return releasedate;
    }

    public void setReleasedate(String releasedate) {
        this.releasedate = releasedate;
    }

    public String getCast() {
        return cast;
    }

    public void setCast(String cast) {
        this.cast = cast;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getTrailer() {
        return trailer;
    }

    public void setTrailer(String trailer) {
        this.trailer = trailer;
    }

    public String getCategories() {
        return categories;
    }

    public void setCategories(String categories) {
        this.categories = categories;
    }

    @Override
    public String toString() {
        return "Movie{" + "id=" + id + ", name=" + name + ", director=" + director + ", releasedate=" + releasedate + ", cast=" + cast + ", description=" + description + ", poster=" + poster + ", duration=" + duration + ", trailer=" + trailer + ", categories=" + categories + '}';
    }
    
    
}
