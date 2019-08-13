Class Utils.cgoma Extends %RegisteredObject
{

/// Cambios cambios para el git asdfasdfasdf
/// Mas cambios para el git
/// Mas cambios mas cambios
/// qwerpqweri qwerqwerasdwerqwerqwerfaqwerwerqwerqwersdf asdfasdfasdfasdfaasdf
ClassMethod buscaLotes() As %Status
{
	set lote1="90228LI00"
	set lote2="91012LI00"
	set lote3="87006LI00"	
	set lote4="89081LI00"	
	
	
	set ruta = "C:\architects"
	
	Set tRS=##class(%ResultSet).%New("%Library.File:FileSet")

	Set tSC=tRS.Execute(ruta,"*")

	Write "Name",?30,"Date Modified",?53,"Type",!
	Write "--------------------------------------------------------------------------",!
	set count = 0
	While tRS.Next() {
		Write tRS.Get("Name"),?30,tRS.Get("DateModified"),?53,tRS.Get("Type"),!
		set rutaFile = tRS.Get("Name")
		w rutaFile,!
		set stream=##class(%Stream.FileCharacter).%New()
       	set sc=stream.LinkToFile(rutaFile)
       	do stream.Rewind()
       	while 'stream.AtEnd {
                 set line=stream.ReadLine()
                 
                 if ($find(line,lote2)!$find(line,lote1)!$find(line,lote3)!$find(line,lote4)){
	                W line,!
                 	set count=$increment(count)
                 	set ^tmpCGOMA(count)=line
                 }
        }
        
        
		    
	    
	    //do stream.Close()
	}
}

ClassMethod crearCSV()
{
	set file = ##class(%File).%New("C:\result\result2.txt")
	do file.Open("WSN")
	s line = ""
	do{
		s line=$o(^tmpCGOMA(line))
		do file.WriteLine(^tmpCGOMA(line))
	}while $o(^tmpCGOMA(line))'=""
}

}

