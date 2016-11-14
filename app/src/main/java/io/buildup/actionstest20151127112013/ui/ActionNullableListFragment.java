package io.buildup.actionstest20151127112013.ui;

import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import ibmmobileappbuilder.ds.Datasource;
import ibmmobileappbuilder.ui.ListGridFragment;
import ibmmobileappbuilder.util.ViewHolder;
import io.buildup.actionstest20151127112013.R;
import ibmmobileappbuilder.ds.SearchOptions;
import ibmmobileappbuilder.ds.filter.Filter;
import java.util.Arrays;
import io.buildup.actionstest20151127112013.ds.NullableDSItem;
import io.buildup.actionstest20151127112013.ds.NullableDS;
import android.content.Intent;
import ibmmobileappbuilder.util.Constants;
import static ibmmobileappbuilder.util.NavigationUtils.generateIntentToAddOrUpdateItem;

/**
 * "ActionNullableListFragment" listing
 */
public class ActionNullableListFragment extends ListGridFragment<NullableDSItem>  {

    private Datasource<NullableDSItem> datasource;


    public static ActionNullableListFragment newInstance(Bundle args) {
        ActionNullableListFragment fr = new ActionNullableListFragment();

        fr.setArguments(args);
        return fr;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    protected SearchOptions getSearchOptions() {
        SearchOptions.Builder searchOptionsBuilder = SearchOptions.Builder.searchOptions();
        return searchOptionsBuilder.build();
    }


    /**
    * Layout for the list itselft
    */
    @Override
    protected int getLayout() {
        return R.layout.fragment_list;
    }

    /**
    * Layout for each element in the list
    */
    @Override
    protected int getItemLayout() {
        return R.layout.actionnullablelist_item;
    }

    @Override
    protected Datasource<NullableDSItem> getDatasource() {
        if (datasource != null) {
            return datasource;
        }
        datasource = NullableDS.getInstance(getSearchOptions());
        return datasource;
    }

    @Override
    protected void bindView(NullableDSItem item, View view, int position) {
        
        TextView title = ViewHolder.get(view, R.id.title);
        
        if (item.url != null){
            title.setText(item.url);
            
        }
        
        TextView subtitle = ViewHolder.get(view, R.id.subtitle);
        
        if (item.email != null){
            subtitle.setText(item.email);
            
        }
    }


    @Override
    public void showDetail(NullableDSItem item, int position) {
        // If we have forms, then we have to refresh when an item has been edited
        // Also with this we support list without details
        Bundle args = new Bundle();
        args.putInt(Constants.ITEMPOS, position);
        args.putParcelable(Constants.CONTENT, item);
        Intent intent = new Intent(getActivity(), ActionNullableListDetailActivity.class);
        intent.putExtras(args);

        if (!getResources().getBoolean(R.bool.tabletLayout)) {
            startActivityForResult(intent, Constants.DETAIL);
        } else {
            startActivity(intent);
        }
    }

}
