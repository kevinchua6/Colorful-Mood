import 'package:flutter/material.dart';
import 'package:untitled/Data/Data.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  _RecordPageState createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  List<Cause> selectedCauses = [];
  List<ButtonWithBottomLabel> btnList = [];

  _RecordPageState() {
    btnList = [
      ButtonWithBottomLabel(
          Icons.house_outlined, 'home', Cause.HOME, selectedCauses),
      ButtonWithBottomLabel(Icons.health_and_safety_outlined, 'health',
          Cause.HEALTH, selectedCauses),
      ButtonWithBottomLabel(
          Icons.work_outline, 'work', Cause.WORK, selectedCauses),
      ButtonWithBottomLabel(Icons.add, 'others', Cause.OTHERS, selectedCauses)
    ];
  }

  void onSubmit() {
    Store.addCauses(selectedCauses);
    Store.commit();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('You selected'),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              color: Colors.amber,
            ),
            child: Image.asset('assets/img.png'),
          ),
          Text('Add state here'),
          Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                children: btnList,
              )),
          Text('What is in your mind?'),
          TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Thoughts...'),
              minLines: 5,
              maxLines: null),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
            child: ElevatedButton(
                onPressed: () {},
                child: Text('Record'),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 70))),
          ),
        ],
      ),
    );
  }
}

class ButtonWithBottomLabel extends StatefulWidget {
  final IconData iconData;
  final String description;
  final Cause cause;
  final List<Cause> lst;
  // function fn
  ButtonWithBottomLabel(this.iconData, this.description, this.cause, this.lst);

  @override
  _ButtonWithBottomLabelState createState() =>
      _ButtonWithBottomLabelState(lst, cause);
}

class _ButtonWithBottomLabelState extends State<ButtonWithBottomLabel> {
  bool selected = false;
  final List<Cause> lst;
  final Cause cause;
  _ButtonWithBottomLabelState(this.lst, this.cause);

  @override
  Widget build(BuildContext context) {
    double? fontsize = Theme.of(context).textTheme.subtitle1!.fontSize;
    double? textsize = fontsize != null ? fontsize * 1.1 : null;
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: [
            IconButton(
              icon: Icon(widget.iconData),
              onPressed: () {
                setState(() {
                  selected = !selected;
                  if (lst.contains(cause)) {
                    lst.remove(cause);
                  } else {
                    lst.add(cause);
                  }
                });
              },
              color: selected ? Colors.blueGrey : null,
            ),
            Text(
              widget.description,
              style: TextStyle(
                color: selected ? Colors.blueGrey : null,
                fontSize: selected ? textsize : fontsize,
              ),
            )
          ],
        ));
  }
}
