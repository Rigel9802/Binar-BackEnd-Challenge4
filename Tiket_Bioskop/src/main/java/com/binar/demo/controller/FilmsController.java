package com.binar.demo.controller;

import com.binar.demo.model.Films;
import com.binar.demo.service.FilmsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/film")
public class FilmsController {
    @Autowired
    private FilmsService service;

    @GetMapping("/getfilms")
    public List<Films> getFilms() {
        return service.getAllFilms();
    }

    @GetMapping("/getbyname")
    public List<Films> findByFilmName(@RequestParam String movie_name) {
        return service.getByName(movie_name);
    }

    @PostMapping("/postfilm")
    public Films addFilm(@RequestBody Films films) {
        return service.postFilm(films);
    }

    @PostMapping("/postfilms")
    public List<Films> postFilms(@RequestBody List<Films> films) {
        return service.postFilms(films);
    }

    @PutMapping("/updatefilm")
    public Films updateFilm(@RequestBody Films films) {
        return service.updateFilm(films);
    }
}
