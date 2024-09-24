;; **Test 6**: Create a WASM module with nested loops that contain `call_indirect` instructions with out-of-bounds table indices. Analyze how the implementations handle these edge cases, focusing on whether incorrect CFG generation leads to misaligned branches or unreachable loops.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func $loopTest
      loop $outer
        loop $inner
          i32.const 10
          call_indirect (type 0) (i32.const 2)
          br $inner
        end
        br $outer
      end
    )
  )
  "out of bounds table index"
)