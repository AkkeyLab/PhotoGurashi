/**
 * Created by akkey on 2017/06/11.
 */
public class MainViewController extends BaseViewController {
    UIButton button1;
    UIButton button2;
    UIButton button3;
    UIImageView backImageView;

    @Override
    void viewDidLoad() {
        setBKImage(backImageView);

        button1.customSetting(this, "Button1");
        button1.tag = 1;
        button2.customSetting(this, "Button2");
        button2.tag = 2;
        button3.customSetting(this, "Button3");
        button3.tag = 3;
    }

    @Override
    void onClickButton(UIButton sender) {
        final String name;

        switch(sender.tag) {
            case 1:
                name = "01";
                break;
            case 2:
                name = "02";
                break;
            case 3:
                name = "03";
                break;
            default:
                name = "04";
        }
        // abbreviate
    }
}
