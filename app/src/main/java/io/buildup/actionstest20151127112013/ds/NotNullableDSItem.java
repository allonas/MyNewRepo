
package io.buildup.actionstest20151127112013.ds;
import ibmmobileappbuilder.ds.restds.GeoPoint;

import ibmmobileappbuilder.mvp.model.IdentifiableBean;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.gson.annotations.SerializedName;

public class NotNullableDSItem implements Parcelable, IdentifiableBean {

    @SerializedName("phone") public String phone;
    @SerializedName("url") public String url;
    @SerializedName("location") public GeoPoint location;
    @SerializedName("email") public String email;
    @SerializedName("id") public String id;

    @Override
    public String getIdentifiableId() {
      return id;
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(phone);
        dest.writeString(url);
        dest.writeDoubleArray(location != null  && location.coordinates.length != 0 ? location.coordinates : null);
        dest.writeString(email);
        dest.writeString(id);
    }

    public static final Creator<NotNullableDSItem> CREATOR = new Creator<NotNullableDSItem>() {
        @Override
        public NotNullableDSItem createFromParcel(Parcel in) {
            NotNullableDSItem item = new NotNullableDSItem();

            item.phone = in.readString();
            item.url = in.readString();
            double[] location_coords = in.createDoubleArray();
            if (location_coords != null)
                item.location = new GeoPoint(location_coords);
            item.email = in.readString();
            item.id = in.readString();
            return item;
        }

        @Override
        public NotNullableDSItem[] newArray(int size) {
            return new NotNullableDSItem[size];
        }
    };

}

