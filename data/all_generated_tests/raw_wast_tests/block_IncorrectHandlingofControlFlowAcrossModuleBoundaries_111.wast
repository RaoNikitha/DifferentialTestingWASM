;; Create a module that exports a function containing a block. Import this function into another module, and call it inside a block in the importing module. Check if the operand stack correctly unwinds and rewinds across the module boundary, matching the required types.

(assert_invalid
 (module (func $exported-func (result i32)
  (block (result i32)
   (i32.const 42)
   (call 0)
  )
  (func (result i32)
   (i32.const 1)
   (i32.add)
  )
 )
 (module
  (import "" "exported-func" (func $imported-func (result i32)))
  (func (result i32)
   (block (result i32)
    (call $imported-func)
   )
  )
 )
) "type mismatch"
)