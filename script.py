import argparse
from pathlib import PurePath

from lxml import etree

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("xml_filename", help="xml file name")
    parser.add_argument("xsl_filename", help="xsl file name")
    parser.add_argument("out_dir", help="output directory")
    args = parser.parse_args()
    out_file_path = PurePath(args.out_dir, PurePath(args.xml_filename).name)
    print(out_file_path)
    dom = etree.parse(args.xml_filename)
    xslt = etree.parse(args.xsl_filename)
    transform = etree.XSLT(xslt)
    newdom = transform(dom)
    with open(out_file_path, "wb") as outfile:
        newdom.write(outfile, encoding="utf-8", pretty_print=True,
            xml_declaration=True)
