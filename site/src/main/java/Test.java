import com.mycompany.util.HttpUtil;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

/**
 * Created by jackie on 4/21/2016.
 */
public class Test {
    public static void main(String[] args) {
        String s = HttpUtil.sendGet("http://weixin.cplotus.com/weixin/jsapi_ticket.ashx?app_key=5539851609&nonce=dasfdfda&stat_src=lzzyad&timestamp=1461208727978&sign=b270ea91b18a6698297800a868c989a6", null);
        System.out.println(s);
    }
}
