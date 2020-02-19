<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require_once FCPATH . 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Spreadsheet;

class Excel {

    public function __construct() {
        $this->CI = & get_instance();
    }

    public function readExcel($path) {
        $inputFileType = IOFactory::identify($path);
        $objReader = IOFactory::createReader($inputFileType);
        $objPHPExcel = $objReader->load($path);
        $count = $objPHPExcel->setActiveSheetIndex(0)->getHighestRow();
        return array(
            "sheet" => $objPHPExcel->getSheet(0),
            "total" => (int) $count
        );
    }

    public function template(array $column, $title = "File excel", $author = "Hello World") {

        $spreadsheet = new Spreadsheet();

        $spreadsheet->getProperties()->setCreator($author)
                ->setLastModifiedBy($author)
                ->setTitle('Office 2007 XLSX Test Document')
                ->setSubject('Office 2007 XLSX Test Document')
                ->setDescription('Test document for Office 2007 XLSX, generated using PHP classes.')
                ->setKeywords('office 2007 openxml php')
                ->setCategory($title);

        $alphabet = range('A', 'Z');

        $_i = 0;

        foreach ($column as $col) {
            $spreadsheet->setActiveSheetIndex(0)->setCellValue($alphabet[$_i] . '1', strtoupper($col));
            $spreadsheet->getActiveSheet()->getColumnDimension($alphabet[$_i])->setAutoSize(true);
            $_i++;
        }

        $firstIndex = $alphabet[0] . "1";
        $lastIndex = $alphabet[count($column)] . "1";

        $spreadsheet->getActiveSheet()->getStyle($firstIndex . ':' . $lastIndex)->applyFromArray(array(
            'font' => array(
                'color' => ['argb' => 'ffffff'],
                'bold' => true,
            ),
            'fill' => [
                'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                'startColor' => [
                    'argb' => '25D366',
                ],
                'endColor' => [
                    'argb' => '25D366',
                ],
            ],
        ));

        $spreadsheet->getActiveSheet()->setTitle($title . ' ' . date('d-m-Y H'));
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="template-' . $title . '.xlsx"');
        header('Cache-Control: max-age=0');
        header('Cache-Control: max-age=1');
        header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
        header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
        header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
        header('Pragma: public'); // HTTP/1.0
        $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
        $writer->save('php://output');
        exit;
    }

    public function download(array $column, array $data, $title = "File excel", $author = "Hello World") {

        $spreadsheet = new Spreadsheet();
        $max = count($data[0]);

        $spreadsheet->getProperties()->setCreator($author)
                ->setLastModifiedBy($author)
                ->setTitle('Office 2007 XLSX Test Document')
                ->setSubject('Office 2007 XLSX Test Document')
                ->setDescription('Test document for Office 2007 XLSX, generated using PHP classes.')
                ->setKeywords('office 2007 openxml php')
                ->setCategory($title);

        $alphabet = range('A', 'Z');

        $_i = 0;

        foreach ($column as $col) {
            $spreadsheet->setActiveSheetIndex(0)->setCellValue($alphabet[$_i] . '1', strtoupper($col));
            $spreadsheet->getActiveSheet()->getColumnDimension($alphabet[$_i])->setAutoSize(true);
            $_i++;
        }

        if (count($data > 0)) {
            $i = 2;
            $keys = array_keys($data[0]);
            foreach ($data as $row) {
                $a = 0;
                foreach ($keys as $key) {
                    $spreadsheet->setActiveSheetIndex(0)->setCellValue($alphabet[$a] . '' . $i, $row[$key]);
                    $a++;
                }
                $i++;
            }
        }


        $firstIndex = $alphabet[0] . "1";
        $lastIndex = $alphabet[$max] . "1";

        $spreadsheet->getActiveSheet()->getStyle($firstIndex . ':' . $lastIndex)->applyFromArray(array(
            'font' => array(
                'color' => ['argb' => 'ffffff'],
                'bold' => true,
            ),
            'fill' => [
                'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                'startColor' => [
                    'argb' => '25D366',
                ],
                'endColor' => [
                    'argb' => '25D366',
                ],
            ],
        ));

        $spreadsheet->getActiveSheet()->setTitle($title . ' ' . date('d-m-Y H'));
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="download-' . $title . '.xlsx"');
        header('Cache-Control: max-age=0');
        header('Cache-Control: max-age=1');
        header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
        header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
        header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
        header('Pragma: public'); // HTTP/1.0
        $writer = IOFactory::createWriter($spreadsheet, 'Xlsx');
        $writer->save('php://output');
        exit;
    }

}
