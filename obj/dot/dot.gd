extends Node2D


signal action(obj, action_name)

onready var timer := $Timer

onready var overlay := $Overlay
onready var back := $back

onready var state := $state

onready var add := $button/add
onready var upgrade := $button/upgrade

onready var ui = $ui