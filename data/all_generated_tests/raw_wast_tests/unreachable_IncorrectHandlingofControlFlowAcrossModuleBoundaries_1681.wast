;; 2. Evaluate a scenario where a function in a module with a local `unreachable` instruction is called by another module, validating that the trap is communicated correctly across module boundaries without corrupting the stack.

(assert_invalid
  (module
    (func $crossModuleUnreachable
      (import "env" "importedFunction" (func (result i32)))
      (func $localFunction
        (unreachable)
        (call $crossModuleUnreachable)
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)