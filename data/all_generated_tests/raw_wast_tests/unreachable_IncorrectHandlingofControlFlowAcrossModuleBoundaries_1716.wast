;; 7. **Test Case 7: Import Function with Unreachable inside Block**    - **Description:** Module B exports a function containing a block with the `unreachable` instruction inside. Module A imports this function and calls it. This tests if block control structures and their traps are respected across module calls.

(assert_invalid
  (module 
    (import "ModuleB" "funcWithUnreachable" (func $importedFunc))
    (func (call $importedFunc))
  )
) 
"undefined import - funcWithUnreachable"
)

(module 
  (export "funcWithUnreachable" (func $funcWithUnreachable))
  (func $funcWithUnreachable
    (block 
      (unreachable)
    )
  )
)