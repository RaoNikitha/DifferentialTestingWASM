;; 4. Define a scenario where a `call_indirect` instruction is used after multiple branching points (`br_table`) that should correctly resolve stack-based control flow transitions. An incorrect target resolution should attempt to call a function outside the valid bounds, resulting in a trap.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func $callee (param i32) (result i32)
      local.get 0
    )
    (func (param i32) (result i32)
      (block (result i32)
        local.get 0
        i32.const 1
        (br_table 0 0 0)
        (call_indirect (type 0) (i32.const 1000000))
      )
    )
  )
  "out of bounds index"
)