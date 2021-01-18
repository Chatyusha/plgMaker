import os
import pynvim

@pynvim.plugin
class PluginMaker(object):

    def __init__(self, nvim):
        self.nvim = nvim

#   @pynvim.command('TestCommand', nargs='*', range='')
#   def testcommand(self, args, range):
#       self.nvim.current.line = ('Command with args: {}, range: {}'.format(args, range))

    @pynvim.command('Mkplug', nargs='*')
    def makePlugin(self, args):
       T=(type(args))
       self.nvim.out_write=("hoge\n")
