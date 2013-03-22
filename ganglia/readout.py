#!/usr/bin/env python

import sys
import logging
import socket

def readout(host="localhost", port=8649, send=None):
  sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
  try:
    sock.connect((host, port))
  except socket.error, e:
    logger.warning('Could not open socket to %s:%d - %s', host, port, e)
    return

  buffer = ""
  while True:
    try:
      data = sock.recv(8192)
    except socket.error, e:
      logger.warning('Could not receive data from %s:%d - %s', host, port, e)
      return

    if not data: break
    buffer += data.decode("ISO-8859-1")

  sock.close()
  return buffer
# end def

def main():

  print readout(host=sys.argv[1])

if __name__ == "__main__":
  main()
