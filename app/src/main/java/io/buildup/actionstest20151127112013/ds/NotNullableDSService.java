
package io.buildup.actionstest20151127112013.ds;
import java.net.URL;
import io.buildup.actionstest20151127112013.R;
import ibmmobileappbuilder.ds.RestService;
import ibmmobileappbuilder.util.StringUtils;

/**
 * "NotNullableDSService" REST Service implementation
 */
public class NotNullableDSService extends RestService<NotNullableDSServiceRest>{

    public static NotNullableDSService getInstance(){
          return new NotNullableDSService();
    }

    private NotNullableDSService() {
        super(NotNullableDSServiceRest.class);

    }

    @Override
    public String getServerUrl() {
        return "https://baked-devel-ibm.herokuapp.com";
    }

    @Override
    protected String getApiKey() {
        return "NJz48WKn";
    }

    @Override
    public URL getImageUrl(String path){
        return StringUtils.parseUrl("https://baked-devel-ibm.herokuapp.com/app/56bc883d228cdc0300318742",
                path,
                "apikey=NJz48WKn");
    }

}
