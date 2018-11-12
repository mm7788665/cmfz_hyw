import com.baizhi.dao.AlbumDAO;
import com.baizhi.entity.Album;
import com.baizhi.entity.Menu;
import com.baizhi.service.AlbumService;
import com.baizhi.service.MenuService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class test {
    @Autowired
    private MenuService menuService;
    @Autowired
    private AlbumDAO albumDAO;
    @Autowired
    private AlbumService albumService;
@Test
    public void sda(){
    List<Menu> menus = menuService.find();
    for (Menu menu : menus) {
        System.out.println(menu);
    }

}
@Test
    public void adada(){
    List<Album> byPage = albumDAO.findByPage(0, 3);
    for (Album album : byPage) {
        System.out.println(byPage);
    }
}
@Test
    public void sdasda(){
    Album album = new Album();
    album.setTitle("2");
    albumService.add(album);
    
}
}
