

package io.buildup.actionstest20151127112013.ui;

import android.os.Bundle;
import android.support.v4.app.Fragment;

import io.buildup.actionstest20151127112013.R;

import ibmmobileappbuilder.ui.BaseListingActivity;
/**
 * ActionsNotNullableListActivity list activity
 */
public class ActionsNotNullableListActivity extends BaseListingActivity {

    @Override
    protected void onCreate(Bundle savedInstance) {
        super.onCreate(savedInstance);

        if(isTaskRoot()) {
            getSupportActionBar().setDisplayHomeAsUpEnabled(false);
        } else {
            getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        }
        
        setTitle(getString(R.string.actionsNotNullableListActivity));
    }

    @Override
    protected Class<? extends Fragment> getFragmentClass() {
        return ActionsNotNullableListFragment.class;
    }

}
