

package io.buildup.actionstest20151127112013.ds;

import android.content.Context;

import java.net.URL;
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;

import ibmmobileappbuilder.ds.SearchOptions;
import ibmmobileappbuilder.ds.restds.AppNowDatasource;
import ibmmobileappbuilder.util.StringUtils;
import ibmmobileappbuilder.ds.restds.TypedByteArrayUtils;

import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

/**
 * "NullableDS" data source. (e37eb8dc-6eb2-4635-8592-5eb9696050e3)
 */
public class NullableDS extends AppNowDatasource<NullableDSItem>{

    // default page size
    private static final int PAGE_SIZE = 20;

    private NullableDSService service;

    public static NullableDS getInstance(SearchOptions searchOptions){
        return new NullableDS(searchOptions);
    }

    private NullableDS(SearchOptions searchOptions) {
        super(searchOptions);
        this.service = NullableDSService.getInstance();
    }

    @Override
    public void getItem(String id, final Listener<NullableDSItem> listener) {
        if ("0".equals(id)) {
                        getItems(new Listener<List<NullableDSItem>>() {
                @Override
                public void onSuccess(List<NullableDSItem> items) {
                    if(items != null && items.size() > 0) {
                        listener.onSuccess(items.get(0));
                    } else {
                        listener.onSuccess(new NullableDSItem());
                    }
                }

                @Override
                public void onFailure(Exception e) {
                    listener.onFailure(e);
                }
            });
        } else {
                      service.getServiceProxy().getNullableDSItemById(id, new Callback<NullableDSItem>() {
                @Override
                public void success(NullableDSItem result, Response response) {
                                        listener.onSuccess(result);
                }

                @Override
                public void failure(RetrofitError error) {
                                        listener.onFailure(error);
                }
            });
        }
    }

    @Override
    public void getItems(final Listener<List<NullableDSItem>> listener) {
        getItems(0, listener);
    }

    @Override
    public void getItems(int pagenum, final Listener<List<NullableDSItem>> listener) {
        String conditions = getConditions(searchOptions, getSearchableFields());
        int skipNum = pagenum * PAGE_SIZE;
        String skip = skipNum == 0 ? null : String.valueOf(skipNum);
        String limit = PAGE_SIZE == 0 ? null: String.valueOf(PAGE_SIZE);
        String sort = getSort(searchOptions);
                service.getServiceProxy().queryNullableDSItem(
                skip,
                limit,
                conditions,
                sort,
                null,
                null,
                new Callback<List<NullableDSItem>>() {
            @Override
            public void success(List<NullableDSItem> result, Response response) {
                                listener.onSuccess(result);
            }

            @Override
            public void failure(RetrofitError error) {
                                listener.onFailure(error);
            }
        });
    }

    private String[] getSearchableFields() {
        return new String[]{"phone", "url", "email"};
    }

    // Pagination

    @Override
    public int getPageSize(){
        return PAGE_SIZE;
    }

    @Override
    public void getUniqueValuesFor(String searchStr, final Listener<List<String>> listener) {
        String conditions = getConditions(searchOptions, getSearchableFields());
                service.getServiceProxy().distinct(searchStr, conditions, new Callback<List<String>>() {
             @Override
             public void success(List<String> result, Response response) {
                                  result.removeAll(Collections.<String>singleton(null));
                 listener.onSuccess(result);
             }

             @Override
             public void failure(RetrofitError error) {
                                  listener.onFailure(error);
             }
        });
    }

    @Override
    public URL getImageUrl(String path) {
        return service.getImageUrl(path);
    }

    @Override
    public void create(NullableDSItem item, Listener<NullableDSItem> listener) {
                          service.getServiceProxy().createNullableDSItem(item, callbackFor(listener));
          }

    private Callback<NullableDSItem> callbackFor(final Listener<NullableDSItem> listener) {
      return new Callback<NullableDSItem>() {
          @Override
          public void success(NullableDSItem item, Response response) {
                            listener.onSuccess(item);
          }

          @Override
          public void failure(RetrofitError error) {
                            listener.onFailure(error);
          }
      };
    }

    @Override
    public void updateItem(NullableDSItem item, Listener<NullableDSItem> listener) {
                          service.getServiceProxy().updateNullableDSItem(item.getIdentifiableId(), item, callbackFor(listener));
          }

    @Override
    public void deleteItem(NullableDSItem item, final Listener<NullableDSItem> listener) {
                service.getServiceProxy().deleteNullableDSItemById(item.getIdentifiableId(), new Callback<NullableDSItem>() {
            @Override
            public void success(NullableDSItem result, Response response) {
                                listener.onSuccess(result);
            }

            @Override
            public void failure(RetrofitError error) {
                                listener.onFailure(error);
            }
        });
    }

    @Override
    public void deleteItems(List<NullableDSItem> items, final Listener<NullableDSItem> listener) {
                service.getServiceProxy().deleteByIds(collectIds(items), new Callback<List<NullableDSItem>>() {
            @Override
            public void success(List<NullableDSItem> item, Response response) {
                                listener.onSuccess(null);
            }

            @Override
            public void failure(RetrofitError error) {
                                listener.onFailure(error);
            }
        });
    }

    protected List<String> collectIds(List<NullableDSItem> items){
        List<String> ids = new ArrayList<>();
        for(NullableDSItem item: items){
            ids.add(item.getIdentifiableId());
        }
        return ids;
    }

}
