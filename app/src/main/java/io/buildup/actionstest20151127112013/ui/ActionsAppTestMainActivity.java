
package io.buildup.actionstest20151127112013.ui;

import android.support.v4.app.Fragment;
import android.util.SparseArray;

import ibmmobileappbuilder.ui.DrawerActivity;

import ibmmobileappbuilder.actions.StartActivityAction;
import ibmmobileappbuilder.util.Constants;
import io.buildup.actionstest20151127112013.R;

public class ActionsAppTestMainActivity extends DrawerActivity {

    private final SparseArray<Class<? extends Fragment>> sectionFragments = new SparseArray<>();
    {
            sectionFragments.append(R.id.entry0, ActionNullableListFragment.class);
            sectionFragments.append(R.id.entry1, ActionsNotNullableListFragment.class);
    }

    @Override
    public SparseArray<Class<? extends Fragment>> getSectionFragmentClasses() {
      return sectionFragments;
    }

}
