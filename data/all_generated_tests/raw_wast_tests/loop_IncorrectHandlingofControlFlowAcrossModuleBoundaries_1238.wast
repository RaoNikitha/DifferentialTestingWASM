;; 9. **Test Case 9**: Create a loop that involves call chain sequences where multiple functions across boundaries are invoked, and the loop uses `get_local` and `set_local` instructions to interact with parameters. This checks if both implementations maintain correct local state and control flow changes.

(assert_invalid
  (module
    (func $callee (param i32) (result i32)
      local.get 0
      i32.const 1
      i32.add
    )
    (func (param i32) (result i32)
      local.get 0
      loop (result i32)
        call $callee
        local.set 0
        local.get 0
        i32.const 10
        i32.lt_s
        br_if 0
      end
      local.get 0
    )
  )
  "type mismatch"
)