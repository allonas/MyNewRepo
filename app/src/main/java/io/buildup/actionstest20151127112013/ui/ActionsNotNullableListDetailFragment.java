
package io.buildup.actionstest20151127112013.ui;
import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.widget.TextView;
import ibmmobileappbuilder.actions.ActivityIntentLauncher;
import ibmmobileappbuilder.actions.MailAction;
import ibmmobileappbuilder.actions.MapsAction;
import ibmmobileappbuilder.actions.OpenUriAction;
import ibmmobileappbuilder.actions.PhoneAction;
import ibmmobileappbuilder.behaviors.ShareBehavior;
import io.buildup.actionstest20151127112013.R;
import ibmmobileappbuilder.ds.Datasource;
import ibmmobileappbuilder.ds.SearchOptions;
import ibmmobileappbuilder.ds.filter.Filter;
import java.util.Arrays;
import io.buildup.actionstest20151127112013.ds.NotNullableDSItem;
import io.buildup.actionstest20151127112013.ds.NotNullableDS;

public class ActionsNotNullableListDetailFragment extends ibmmobileappbuilder.ui.DetailFragment<NotNullableDSItem> implements ShareBehavior.ShareListener  {

    private Datasource<NotNullableDSItem> datasource;
    public static ActionsNotNullableListDetailFragment newInstance(Bundle args){
        ActionsNotNullableListDetailFragment fr = new ActionsNotNullableListDetailFragment();
        fr.setArguments(args);

        return fr;
    }

    public ActionsNotNullableListDetailFragment(){
        super();
    }

    @Override
    public Datasource<NotNullableDSItem> getDatasource() {
        if (datasource != null) {
            return datasource;
    }
       datasource = NotNullableDS.getInstance(new SearchOptions());
        return datasource;
    }

    @Override
    public void onCreate(Bundle state) {
        super.onCreate(state);
        addBehavior(new ShareBehavior(getActivity(), this));

    }

    // Bindings

    @Override
    protected int getLayout() {
        return R.layout.actionsnotnullablelistdetail_detail;
    }

    @Override
    @SuppressLint("WrongViewCast")
    public void bindView(final NotNullableDSItem item, View view) {
        if (item.phone != null){
            
            TextView view0 = (TextView) view.findViewById(R.id.view0);
            view0.setText(item.phone);
            bindAction(view0, new PhoneAction(new ActivityIntentLauncher(), item.phone));
        }
        if (item.url != null){
            
            TextView view1 = (TextView) view.findViewById(R.id.view1);
            view1.setText(item.url);
            bindAction(view1, new OpenUriAction(new ActivityIntentLauncher(), item.url));
        }
        if (item.location != null){
            
            TextView view2 = (TextView) view.findViewById(R.id.view2);
            view2.setText(item.location.toString());
            bindAction(view2, new MapsAction(new ActivityIntentLauncher(), "http://maps.google.com/maps?q=" + item.location.toString()));
        }
        if (item.email != null){
            
            TextView view3 = (TextView) view.findViewById(R.id.view3);
            view3.setText(item.email);
            bindAction(view3, new MailAction(new ActivityIntentLauncher(), item.email));
        }
    }

    @Override
    protected void onShow(NotNullableDSItem item) {
        // set the title for this fragment
        getActivity().setTitle("Detail");
    }
    @Override
    public void onShare() {
        NotNullableDSItem item = getItem();

        Intent intent = new Intent();
        intent.setAction(Intent.ACTION_SEND);
        intent.setType("text/plain");

        intent.putExtra(Intent.EXTRA_TEXT, (item.phone != null ? item.phone : "" ) + "\n" +
                    (item.url != null ? item.url : "" ) + "\n" +
                    (item.location != null ? item.location.toString() : "" ) + "\n" +
                    (item.email != null ? item.email : "" ));
        intent.putExtra(Intent.EXTRA_SUBJECT, "Detail");
        startActivityForResult(Intent.createChooser(intent, getString(R.string.share)), 1);
    }
}
