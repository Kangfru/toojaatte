package com.toojaatte.stock.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.lang.ProcessBuilder.Redirect;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.opencsv.CSVReader;
import com.toojaatte.stock.dto.GraphDTO;
import com.toojaatte.stock.dto.PredictionDTO;
import com.toojaatte.stock.service.StockService;

@RestController
@RequestMapping("/stock")
public class StockRestController {

	@Autowired
	@Qualifier("ss")
	private StockService service;

	@GetMapping("/graph/data")
	public ResponseEntity<List<GraphDTO>> getGraph(Model model, @RequestParam String code, @RequestParam String term) throws Exception {

		ClassPathResource resource = new ClassPathResource("com/toojaatte/stock/python/getGraphData.py");
		Path path = Paths.get(resource.getURI());
		String pathDir = path.toString().substring(0, path.getParent().toString().length());
		String[] command = new String[] {"python", path.toString(), code, term, pathDir};
		runProcessBuilder(command);
		
		List<String[]> data = new ArrayList<String[]>();
		List<GraphDTO> graphList = new ArrayList<GraphDTO>();
		
		try {
//            CSVReader reader = new CSVReader(new FileReader(pathDir + "/" + "graphData.csv"));
            // UTF-8
			CSVReader reader = new CSVReader(new InputStreamReader(new FileInputStream(pathDir + "/" + "graphData.csv"), "UTF-8"));
            data = reader.readAll();
            for(String[] str : data) {
            	GraphDTO graph = new GraphDTO();
            	graph.setDate(str[0]);
            	graph.setOpen(str[1]);
            	graph.setHigh(str[2]);
            	graph.setLow(str[3]);
            	graph.setClose(str[4]);
            	graph.setVolume(str[5]);
            	graph.setChange(str[6]);
            	graphList.add(graph);
            }
            
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

//		model.addAttribute("graphList", graphList);
		
		return new ResponseEntity<List<GraphDTO>>(graphList, HttpStatus.OK);
	}
	
//	@GetMapping("/ml/data")
//	public String getPredict(@RequestParam String code) throws Exception{
//		
//		String[] venvCommand = new String[] {"E:/Worksapce/Python/ml/venv/Scripts/activate.bat", "&&", "python", "E:/Worksapce/Python/ml/LSTM.py"};
//		runProcessBuilder(venvCommand);
//		
//		return "";
//	}

	@GetMapping("/ml/data")
	public ResponseEntity<List<PredictionDTO>> getPredict() throws Exception{
		
		
		return new ResponseEntity<List<PredictionDTO>> (service.prediction(), HttpStatus.OK);
	}
	

	public void runProcessBuilder(String[] command) throws IOException, InterruptedException {
		ProcessBuilder builder = new ProcessBuilder(command);
		builder.redirectOutput(Redirect.PIPE);
		builder.redirectError(Redirect.INHERIT);
		builder.start();
		
		Process process = builder.start();

		printStream(process);
	}

	private void printStream(Process process) throws IOException, InterruptedException {
		process.waitFor();
		try (InputStream psout = process.getInputStream()) {
			copy(psout, System.out);
		}
	}

	public void copy(InputStream input, OutputStream output) throws IOException {
		byte[] buffer = new byte[1024];
		int n = 0;
		while ((n = input.read(buffer)) != -1) {
			// 출력 결과를 확인하고 싶으면 이 주석 해제
//			output.write(buffer, 0, n);

		}
	}

}
