package com.kbstar.controller;

import com.kbstar.dto.Item;
import com.kbstar.dto.Marker;
import com.kbstar.dto.MarkerSearch;
import com.kbstar.service.MarkerService;
import com.kbstar.util.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/marker")
public class MarkerController {
    @Autowired
    MarkerService markerService;
    String dir = "marker/";
    @Value("${uploadimgdir}")
    String imgdir;
    @RequestMapping("/map")
    public String markerall(Model model) {
        model.addAttribute("center",dir+"map");
        return "index";
    }

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Marker> list = null;
        list = markerService.get();
        model.addAttribute("list",list);
        model.addAttribute("center",dir+"all");
        return "index";
    }
    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("center",dir+"add");
        return "index";
    }
    @RequestMapping("/addimpl")
    public String addimpl(Model model, Marker marker) throws Exception {
        MultipartFile mf = marker.getImgfile();
        String imgname = mf.getOriginalFilename();
        marker.setImg(imgname);
        markerService.register(marker);
        FileUploadUtil.saveFile(mf,imgdir);
        return "redirect:/marker/all";
    }
    @RequestMapping("/detail")
    public String detail(Model model, int id) throws Exception {
        Marker marker = null;
        marker = markerService.get(id);
        model.addAttribute("gmarker",marker);
        model.addAttribute("center",dir+"detail");
        return "index";
    }
    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, Marker marker) throws Exception {
        MultipartFile mf = marker.getImgfile();
        String new_imgname = mf.getOriginalFilename();
        if(!new_imgname.equals("") || new_imgname != null){
            marker.setImg(new_imgname);
            FileUploadUtil.saveFile(mf,imgdir);
        }
        markerService.modify(marker);

        return "redirect:/marker/detail?id="+marker.getId();
    }
    @RequestMapping("/deleteimpl")
    public String deleteimpl(int id) throws Exception {
        markerService.remove(id);
        return "redirect:/marker/all";
    }
    @RequestMapping("/search")
    public String search(Model model, MarkerSearch ms) throws Exception {
        List<Marker> list = markerService.search(ms);
        model.addAttribute("list",list);
        model.addAttribute("ms",ms);
        model.addAttribute("center",dir+"all");
        return "index";
    }
}
