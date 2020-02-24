package com.virtualeye.virtualeye;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.ArrayList;
public class BluetoothDevicesAdapter extends ArrayAdapter<String> {
    public BluetoothDevicesAdapter(@NonNull Context context, ArrayList<String> devices) {
        super(context, 0, devices);
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {


        //check if the view is created or not if not inflate new one
        if (convertView == null) {
            convertView = LayoutInflater.from(getContext()).inflate(R.layout.item_device, parent, false);
        }
        //get a instance from the viewHolder class
        ViewHolder holder = new ViewHolder();
        holder.deviceName = (TextView) convertView.findViewById(R.id.device_name_textView);
        convertView.setTag(holder);

        //set the current device name
        String deviceName = getItem(position);
        if (deviceName != null) {
            holder.deviceName.setText(deviceName);
        }
        return convertView;
    }

    /**
     * View holder stores each of the component views inside the tag field of the Layout
     */
    private static class ViewHolder {
        TextView deviceName;
    }
}
