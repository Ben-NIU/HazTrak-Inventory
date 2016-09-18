# HazTrak-Inventory   
#### (by Ben NIU from Michael L. Gross lab, Washington University in St. Louis)
### This web-based UI is designed to facilitate the recording of *HazTrak inventory* chemical ID/#.  




_______
### Instructions on how to use it:  

#### Sidebar Panel & Full List Tab

1. Upload the .csv inventory file by clicking "Choose File" button. Under the "Full List" tab, a table corresponding to the inventory list should appear AUTOMATICALLY.

2. To add item to the inventory list, input the "item # / id" to the 1st blank of sidebar, select the "State of chemical" (Solid, Liquid or Gas) and then click "Add item!" button.

3. For any new items added to the list, one of the following two would happen: (i) If the current inventory list does NOT contain the "item id / #" you added, this "item id / #" would be inserted to the FIRST ROW of the current list; (ii) If the current inventory list already contains the "item id / #", it will refresh the existing item by specifying its state (solid, liquid or gas) and put the corresponding row to the TOP OF LIST.

4. If, by any chance, you wanna remove an item from the inventory list (e.g., you added something to it but later on realized that you mis-spelt the id / #), simply input the "item id / #" to the 2nd blank of sidebar and hit "Delete item!" button.

#### Confirmed & Unconfirmed Chemicals Tab

1. Unlike in the Full list Tab where contents are shown interactively, the contents in these two tabs will NOT present / update until you hit the red "Update List!" button

2. Under Confirmed Chemicals Tab, only those chemicals inputted by user are shown. (i.e., the lab DOES have those chemicals.)

3. Under Unconfirmed Chemicals Tab, only those chemicals that are on the Inventory List BUT NOT FOUND IN THE LAB are shown.

#### Download files

(i). Once done with Add / Delete, you can download the full inventory list (containing both confirmed & unconfirmed chemicals) by clicking the "Download Full Inventory" button.

(ii). Under the "Confirmed Chemicals" Tab, you can download those confirmed chemicals ONLY by clicking the "Download Confirmed Chemicals!" button.

(iii). Under the "Unconfirmed Chemicals" Tab, download the unconfirmed chemicals by clicking the "Download Unconfirmed Chemicals!" button.
