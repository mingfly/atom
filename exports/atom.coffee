{Point, Range} = require 'text-buffer'
{deprecate} = require 'grim'

module.exports =
  BufferedNodeProcess: require '../src/buffered-node-process'
  BufferedProcess: require '../src/buffered-process'
  GitRepository: require '../src/git-repository'
  Point: Point
  Range: Range

Object.defineProperty module.exports, 'Git', get: ->
  deprecate "Please require `GitRepository` instead of `Git`: `{GitRepository} = require 'atom'`"
  module.exports.GitRepository

# The following classes can't be used from a Task handler and should therefore
# only be exported when not running as a child node process
unless process.env.ATOM_SHELL_INTERNAL_RUN_AS_NODE
  {$, $$, $$$, View} = require '../src/space-pen-extensions'

  module.exports.$ = $
  module.exports.$$ = $$
  module.exports.$$$ = $$$
  module.exports.EditorView = require '../src/editor-view'
  module.exports.ScrollView = require '../src/scroll-view'
  module.exports.SelectListView = require '../src/select-list-view'
  module.exports.Task = require '../src/task'
  module.exports.View = View
  module.exports.WorkspaceView = require '../src/workspace-view'
  module.exports.Workspace = require '../src/workspace'
  module.exports.React = require 'react-atom-fork'
  module.exports.Reactionary = require 'reactionary-atom-fork'
