package com.virtualeye.virtualeye;

import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;

import android.speech.RecognizerIntent;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.Toast;

import com.google.android.material.floatingactionbutton.FloatingActionButton;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity implements AdapterView.OnItemClickListener, View.OnClickListener {
	private String[] classNames;
	Button btn;
	FloatingActionButton fbutton;
	private static final int REQUEST_CODE = 100;
	private static final Class<?>[] CLASSES = new Class<?>[]{
			TextActivity.class,
			ImageActivity.class,
			LandmarkActivity.class,
			AutoMLActivity.class
	};

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		classNames = getResources().getStringArray(R.array.class_name);

		btn=(Button) findViewById(R.id.btns);
		btn.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				Intent in=new Intent(MainActivity.this,settingActivity.class);
				startActivity(in);
			}
		});

		ListView listView = findViewById(R.id.list_view);
		fbutton=(FloatingActionButton)findViewById(R.id.voicecommand);
		ArrayAdapter<String> adapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, classNames);
		listView.setAdapter(adapter);
		listView.setOnItemClickListener(this);
		fbutton.setOnClickListener(MainActivity.this);
	}

	@Override
	public void onItemClick(AdapterView<?> adapterView, View view, int position, long id) {
		Intent intent = new Intent(this, CLASSES[position]);
		intent.putExtra(BaseActivity.ACTION_BAR_TITLE, classNames[position]);
		startActivity(intent);
	}

	@Override
	public void onClick(View v) {
		if(v.getId()==fbutton.getId()){
			Intent intent = new Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH);

			try {
				startActivityForResult(intent, REQUEST_CODE);
			} catch (ActivityNotFoundException a) {

			}
		}
	}
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		super.onActivityResult(requestCode, resultCode, data);

		switch (requestCode) {
			case REQUEST_CODE: {
				if (resultCode == RESULT_OK && null != data) {
					ArrayList<String> result = data.getStringArrayListExtra(RecognizerIntent.EXTRA_RESULTS);
					String out=result.get(0);
					if(out.contains("front") || out.contains("text to speech")||out.matches("setting")){
						Intent intent =new Intent(MainActivity.this,ImageActivity.class);
						startActivity(intent);
						Toast.makeText(MainActivity.this,"image",Toast.LENGTH_SHORT).show();
					}
					if(out.contains("read")){
						Intent intent=new Intent(MainActivity.this,TextActivity.class);
						startActivity(intent);
						Toast.makeText(MainActivity.this,"text to speech",Toast.LENGTH_SHORT).show();
					}
					if(out.contains("setting")|| out.contains("settings")){
						Intent intent=new Intent(MainActivity.this,settingActivity.class);
						startActivity(intent);
						Toast.makeText(MainActivity.this,"settings",Toast.LENGTH_SHORT).show();
					}
					if(out.contains("landmark")){
						Intent intent=new Intent(MainActivity.this,LandmarkActivity.class);
						startActivity(intent);
					}
					if(out.contains("virtual")){
						Intent intent=new Intent(MainActivity.this,AutoMLActivity.class);
						startActivity(intent);
					}
				}
				break;
			}

		}
	}

}

