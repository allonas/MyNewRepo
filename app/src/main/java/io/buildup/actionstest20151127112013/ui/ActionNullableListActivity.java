

package io.buildup.actionstest20151127112013.ui;

import android.os.Bundle;
import android.support.v4.app.Fragment;

import io.buildup.actionstest20151127112013.R;

import ibmmobileappbuilder.ui.BaseListingActivity;
/**
 * ActionNullableListActivity list activity
 */
public class ActionNullableListActivity extends BaseListingActivity {

    @Override
    protected void onCreate(Bundle savedInstance) {
        super.onCreate(savedInstance);

        if(isTaskRoot()) {
            getSupportActionBar().setDisplayHomeAsUpEnabled(false);
        } else {
            getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        }
        
        setTitle(getString(R.string.actionNullableListActivity));
    }

    @Override
    protected Class<? extends Fragment> getFragmentClass() {
        return ActionNullableListFragment.class;
    }

}
