

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
 * "NotNullableDS" data source. (e37eb8dc-6eb2-4635-8592-5eb9696050e3)
 */
public class NotNullableDS extends AppNowDatasource<NotNullableDSItem>{

    // default page size
    private static final int PAGE_SIZE = 20;

    private NotNullableDSService service;

    public static NotNullableDS getInstance(SearchOptions searchOptions){
        return new NotNullableDS(searchOptions);
    }

    private NotNullableDS(SearchOptions searchOptions) {
        super(searchOptions);
        this.service = NotNullableDSService.getInstance();
    }

    @Override
    public void getItem(String id, final Listener<NotNullableDSItem> listener) {
        if ("0".equals(id)) {
                        getItems(new Listener<List<NotNullableDSItem>>() {
                @Override
                public void onSuccess(List<NotNullableDSItem> items) {
                    if(items != null && items.size() > 0) {
                        listener.onSuccess(items.get(0));
                    } else {
                        listener.onSuccess(new NotNullableDSItem());
                    }
                }

                @Override
                public void onFailure(Exception e) {
                    listener.onFailure(e);
                }
            });
        } else {
                      service.getServiceProxy().getNotNullableDSItemById(id, new Callback<NotNullableDSItem>() {
                @Override
                public void success(NotNullableDSItem result, Response response) {
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
    public void getItems(final Listener<List<NotNullableDSItem>> listener) {
        getItems(0, listener);
    }

    @Override
    public void getItems(int pagenum, final Listener<List<NotNullableDSItem>> listener) {
        String conditions = getConditions(searchOptions, getSearchableFields());
        int skipNum = pagenum * PAGE_SIZE;
        String skip = skipNum == 0 ? null : String.valueOf(skipNum);
        String limit = PAGE_SIZE == 0 ? null: String.valueOf(PAGE_SIZE);
        String sort = getSort(searchOptions);
                service.getServiceProxy().queryNotNullableDSItem(
                skip,
                limit,
                conditions,
                sort,
                null,
                null,
                new Callback<List<NotNullableDSItem>>() {
            @Override
            public void success(List<NotNullableDSItem> result, Response response) {
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
    public void create(NotNullableDSItem item, Listener<NotNullableDSItem> listener) {
                          service.getServiceProxy().createNotNullableDSItem(item, callbackFor(listener));
          }

    private Callback<NotNullableDSItem> callbackFor(final Listener<NotNullableDSItem> listener) {
      return new Callback<NotNullableDSItem>() {
          @Override
          public void success(NotNullableDSItem item, Response response) {
                            listener.onSuccess(item);
          }

          @Override
          public void failure(RetrofitError error) {
                            listener.onFailure(error);
          }
      };
    }

    @Override
    public void updateItem(NotNullableDSItem item, Listener<NotNullableDSItem> listener) {
                          service.getServiceProxy().updateNotNullableDSItem(item.getIdentifiableId(), item, callbackFor(listener));
          }

    @Override
    public void deleteItem(NotNullableDSItem item, final Listener<NotNullableDSItem> listener) {
                service.getServiceProxy().deleteNotNullableDSItemById(item.getIdentifiableId(), new Callback<NotNullableDSItem>() {
            @Override
            public void success(NotNullableDSItem result, Response response) {
                                listener.onSuccess(result);
            }

            @Override
            public void failure(RetrofitError error) {
                                listener.onFailure(error);
            }
        });
    }

    @Override
    public void deleteItems(List<NotNullableDSItem> items, final Listener<NotNullableDSItem> listener) {
                service.getServiceProxy().deleteByIds(collectIds(items), new Callback<List<NotNullableDSItem>>() {
            @Override
            public void success(List<NotNullableDSItem> item, Response response) {
                                listener.onSuccess(null);
            }

            @Override
            public void failure(RetrofitError error) {
                                listener.onFailure(error);
            }
        });
    }

    protected List<String> collectIds(List<NotNullableDSItem> items){
        List<String> ids = new ArrayList<>();
        for(NotNullableDSItem item: items){
            ids.add(item.getIdentifiableId());
        }
        return ids;
    }

}
