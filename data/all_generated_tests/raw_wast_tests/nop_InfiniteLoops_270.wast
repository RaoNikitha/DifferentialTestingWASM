;; 1. Create a loop containing only `nop` instructions. The test should verify if the loop will correctly terminate or get stuck in an infinite loop due to improper handling of `nop`.

(assert_invalid (module (func (loop (nop))) "type mismatch"))