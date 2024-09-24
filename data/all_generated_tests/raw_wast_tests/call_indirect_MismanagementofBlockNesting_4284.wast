;; Define a WebAssembly module where the `call_indirect` instruction is placed within a conditional block nested inside a loop. Force mismanagement of branching using `br` and ensure that correct function call behavior is maintained despite the nesting complexity.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table (export "t") 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (param i32) (result i32) (local.get 0))
    (func (result i32)
      (loop (block (br_if 1 (i32.const 0)) (call_indirect (type $sig) (i32.const 0) (i32.const 42))))
    )
  )
  "type mismatch or invalid behaviour due to complex nesting"
)