import argparse

import lxml.etree as ET

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("xml_filename", help="xml file name")
    parser.add_argument("xsl_filename", help="xsl file name")
    args = parser.parse_args()
    dom = ET.parse(args.xml_filename)
    xslt = ET.parse(args.xsl_filename)
    transform = ET.XSLT(xslt)
    newdom = transform(dom)
    print(ET.tostring(newdom, pretty_print=True))
